class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, foreign_key: {to_table: :users}, index: true
      t.references :post, foreign_key: true, index: true
      t.text :text
      t.timestamps
    end

    add_index :comments, :author_id
    add_index :comments, :post_id
  end
end
