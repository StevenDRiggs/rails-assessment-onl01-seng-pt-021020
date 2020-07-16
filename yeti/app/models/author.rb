class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books
  has_many :book_genres, through: :books
  has_many :genres, through: :book_genres

  has_many :favorite_authors
  has_many :users, through: :favorite_authors
end
