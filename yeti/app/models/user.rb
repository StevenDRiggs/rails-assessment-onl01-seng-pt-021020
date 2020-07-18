class User < ApplicationRecord
  has_secure_password

  has_many :favorite_authors
  has_many :authors, through: :favorite_authors

  has_many :favorite_books
  has_many :books, through: :favorite_books

  has_many :favorite_genres
  has_many :genres, through: :favorite_genres

  
  def fav_authors(author)
    self.favorite_authors.where(author_id: author.id).first
  end
end
