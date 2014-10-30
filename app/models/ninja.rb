class Ninja < ActiveRecord::Base
  attr_reader :password

  validates :password_digest, :presence => true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true, :uniqueness => true
  # validates :email, :presence => true, :uniqueness => true

  before_validation :ensure_session_token


  def self.find_or_create_by_fb_auth_hash(auth_hash)
    ninja = self.find_by(
      provider: auth_hash[:provider], uid: auth_hash[:uid]
    )

    unless ninja
      ninja = self.create!(
        provider: auth_hash[:provider],
        uid: auth_hash[:uid],
        password: SecureRandom::urlsafe_base64(16)
      )
    end

    ninja
  end


  def self.find_by_credentials(email, password)
    ninja = self.find_by_email(email)
    ninja.try(:is_password?, password) ? ninja : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
