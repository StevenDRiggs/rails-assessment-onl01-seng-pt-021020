class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def class_name
    self.class.name
  end

  def display_name
    if self.has_attribute?(:name)
      self.name
    elsif self.has_attribute?(:title)
      self.title
    else
      nil
    end
  end
end
