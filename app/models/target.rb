class Target < ActiveRecord::Base

  belongs_to :ninja

  include PgSearch
  pg_search_scope :search_by_name, against: :name
  multisearchable against: :name

end
