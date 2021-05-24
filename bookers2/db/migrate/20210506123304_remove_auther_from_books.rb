class RemoveAutherFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :auther, :text
  end
end
