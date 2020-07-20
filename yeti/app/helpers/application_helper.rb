module ApplicationHelper
  def flashed
    if flash[:errors]
      class_ = 'errors'
      @messages = flash[:errors]
    elsif flash[:success]
      class_ = 'success'
      @messages = flash[:success]
    end

    if @messages
      html = <<-HTML
        <div class="#{class_}">
          <ul>
      HTML

      @messages.each do |msg|
        html << "<li>#{msg}</li>"
      end

      html << <<-HTML
          </ul>
        </div>
      HTML
      html.html_safe
    else
      nil
    end
  end

  def index_path(object_)
    self.send("#{object_.class_name.tableize}_path")
  end

  def new_path(group)
    if params[:user_id]
      self.send("new_user_#{group}_path", params[:user_id])
    else
      self.send("new_#{group}_path")
    end
  end

  def delete_path(object_)
    self.send("delete_#{object_.class_name.underscore}_path", object_.id)
  end

  def destroy_path(object_)
    self.send("destroy_#{object_.class_name.underscore}_path", object_.id)
  end

  #######

  def display_attributes(object_)
    attrs = object_.attributes
    attrs.delete_if do |key, val|
      %w(created_at updated_at id).include? (key) or val == object_.display_name
    end

    attrs.collect do |key, val|
      <<-HTML
        <h3>#{key}</h3>
        <p>#{val || 'Not provided'}</p>
      HTML
    end.join('<br>').html_safe
  end

  def index(objects)
    if objects.empty?
      '<h1>None found in database</h1>'.html_safe
    else
      group = objects[0].class.name.pluralize
      html = "<h2>#{group}</h2>"

      objects.each do |object_|
        html << "<h3>#{self.send('link_to', object_.display_name, object_)}</h3>"
      end

      html.html_safe
    end
  end
end
