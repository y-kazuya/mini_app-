class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name, null: false, index: true, unique: true
      t.text   :text, null: false, unique: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
