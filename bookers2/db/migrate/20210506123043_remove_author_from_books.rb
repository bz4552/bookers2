class RemoveAuthorFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :author, :text
  end
end
