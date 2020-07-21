class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books

  has_many :book_genres
  has_many :genres, through: :book_genres

  has_many :favorite_books
  has_many :users, through: :favorite_books

  validates :title, presence: true

  def self.popular
    self.joins(:favorite_books).group(:title).order(count_title: :desc).order(title: :asc).count(:title)
  end
end
