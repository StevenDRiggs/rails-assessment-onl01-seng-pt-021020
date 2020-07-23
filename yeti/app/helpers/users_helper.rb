module UsersHelper
  def favorite_authors(user)
    authors = user.authors

    unless authors.empty? 
      html = <<-HTML
        <fieldset>
          <legend>Favorite Authors (#{self.send('link_to', 'View All', user_authors_path(user))}</legend>
      HTML

      authors.each do |author|
        fa = user.fav_authors(author)
        html << "#{self.send('link_to', author.name, author)}"
        html << self.send('form_for', fa, url: update_author_notes_path(user, fa)) { |f|
          inner_html = "#{f.label :notes}"
          inner_html << "#{f.text_area :notes}"
          inner_html << "#{f.submit 'Save Note'}"
          inner_html.html_safe
        }
      end

      html << '</fieldset>'

      html.html_safe
    else
      nil
    end
  end

  def favorite_books(user)
    books = user.books

    unless books.empty? 
      html = <<-HTML
        <fieldset>
          <legend>Favorite Books (#{self.send('link_to', 'View All', user_books_path(user))})</legend>
      HTML

      books.each do |book|
        fb = user.fav_books(book)
        html << "#{self.send('link_to', book.name, book)}"
        html << self.send('form_for', fb, url: update_book_notes_path(user, fb)) { |f|
          inner_html = "#{f.label :notes}"
          inner_html << "#{f.text_area :notes}"
          inner_html << "#{f.submit 'Save Note'}"
          inner_html.html_safe
        }
      end

      html << '</fieldset>'

      html.html_safe
    else
      nil
    end
  end

  def favorite_genres(user)
    genres = user.genres

    unless genres.empty? 
      html = <<-HTML
        <fieldset>
          <legend>Favorite Genres (#{self.send('link_to', 'View All', user_genres_path(user))})</legend>
      HTML

      genres.each do |genre|
        fg = user.fav_genres(genre)
        html << "#{self.send('link_to', genre.name, genre)}"
        html << self.send('form_for', fg, url: update_genre_notes_path(user, fg)) { |f|
          inner_html = "#{f.label :notes}"
          inner_html << "#{f.text_area :notes}"
          inner_html << "#{f.submit 'Save Note'}"
          inner_html.html_safe
        }
      end

      html << '</fieldset>'

      html.html_safe
    else
      nil
    end
  end
end
