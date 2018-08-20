class RemoveScoreFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :score, :integer
  end
end
