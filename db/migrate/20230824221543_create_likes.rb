class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author, null: false, foreign_key: {to_table: 'users'}, index: true
      t.references :post, foreign_key: true, index: true
      t.timestamps
    end
  end
end
