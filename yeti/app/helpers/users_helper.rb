module UsersHelper
  def favorite_authors(user)
    authors = user.authors

    unless authors.empty? 
      html = <<-HTML
        <fieldset>
          <legend>Favorite Authors</legend>
      HTML

      authors.each do |author|
        html << "#{self.send('link_to', author.name, author)}<br>"
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
          <legend>Favorite Books</legend>
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
          <legend>Favorite Books</legend>
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
