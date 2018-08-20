class AddScoreFromComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :score, :integer
  end
end
