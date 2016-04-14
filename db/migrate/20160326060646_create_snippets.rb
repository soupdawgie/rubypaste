class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :title
      t.text :code
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
    add_index :snippets, [:user_id, :created_at]
  end
end
