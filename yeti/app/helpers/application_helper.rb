module ApplicationHelper
  def index_path(object_)
    self.send("#{object_.class_name.tableize}_path")
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

  def index(group, objects)
    html = "<h2>#{group}</h2>"

    objects.each do |object_|
      html << "<h3>#{object_.display_name}</h3>"
    end

    html.html_safe
  end
end
