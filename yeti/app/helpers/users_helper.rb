module UsersHelper
  def favorite_authors(user)
    authors = user.authors

    unless authors.empty? 
      html = <<-HTML
        <fieldset>
          <legend>Favorite Authors (#{self.send('link_to', 'View All', user_authors_path(user))}</legend>
      HTML

      authors.each do |author|
        html << "#{self.send('link_to', author.name, author)}"
        html << self.send('form_for', user.fav_authors(author), url: update_author_notes_path(user, author)) { |f|
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
        html << "#{self.send('link_to', book.title, book)}<br>"
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
          <legend>Favorite Books (#{self.send('link_to', 'View All', user_genres_path(user))})</legend>
      HTML

      genres.each do |genre|
        html << "#{self.send('link_to', genre.name, genre)}<br>"
      end

      html << '</fieldset>'

      html.html_safe
    else
      nil
    end
  end
end
