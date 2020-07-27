module UsersHelper
  def user_email(user)
    if user.id == session[:user_id] || is_admin?
      html = <<-HTML
        <h3>Email</h3>
        <p>#{@user.email}</p>
      HTML

      html.html_safe
    else
      nil
    end
  end

  def favorite_authors(user)
    favorites(user, 'authors')
  end

  def favorite_books(user)
    favorites(user, 'books')
  end

  def favorite_genres(user)
    favorites(user, 'genres')
  end


  private
    def favorites(user, list_type)
      items = user.send(list_type)
      item_caption = list_type.capitalize

    unless items.empty? 
      html = <<-HTML
        <fieldset>
          <legend>Favorite #{item_caption} (#{self.send('link_to', "View All #{item_caption}", self.send("user_#{list_type}_path", user))}</legend>
      HTML

      items.each do |item|
        fi = user.send("fav_#{list_type}", item)
        html << "#{self.send('link_to', item.name, item)}"
        html << '<br>'
        if user.id == session[:user_id] || is_admin?
          html << self.send('form_for', fi, url: self.send("update_#{list_type.singularize}_notes_path", user, fi)) { |f|
            inner_html = "#{f.label :notes}"
            inner_html << "#{f.text_area :notes}"
            inner_html << "#{f.submit 'Save Note'}"
            inner_html.html_safe
          }
        end
      end

      html << '</fieldset>'

      html.html_safe
    else
      nil
    end
    end
end
