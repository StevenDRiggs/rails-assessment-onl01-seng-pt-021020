module ApplicationHelper
  def index_path(object_)
    self.send("#{object_.class_name.tableize}_path")
  end

  def destroy_path(object_)
    self.send("destroy_#{object_.class_name.underscore}_path", object_.id)
  end
end
