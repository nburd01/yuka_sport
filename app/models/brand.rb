class Brand < ApplicationRecord

  has_many :likes, dependent: :destroy
  has_many :posts

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
    

  validates :name, length: { minimum: 2 }
  validates :name, :uniqueness => { :message => "Cette marque existe déjà"}
  validates :rank, presence: true

  

end


