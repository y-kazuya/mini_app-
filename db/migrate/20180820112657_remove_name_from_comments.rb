class RemoveNameFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :text, :text
  end
end
