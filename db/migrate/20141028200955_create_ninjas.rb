class CreateNinjas < ActiveRecord::Migration
  def change
    create_table :ninjas do |t|
      t.string :email
      t.string :password_digest
      t.string :session_token

      t.timestamps
    end
  end
end
