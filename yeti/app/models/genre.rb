class Genre < ApplicationRecord
  has_many :book_genres
  has_many :books, through: :book_genres
  has_many :author_books, through: :books
  has_many :authors, through: :author_books

  has_many :favorite_genres
  has_many :users, through: :favorite_genres

  validates :name, presence: true

  def self.popular
    self.joins(:favorite_genres).group(:name).order(count_name: :desc).order(name: :asc).count(:name)
  end
end
