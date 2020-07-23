class ChangeTitleToNameInBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :title, :name
  end
end
