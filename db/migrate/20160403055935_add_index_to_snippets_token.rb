class AddIndexToSnippetsToken < ActiveRecord::Migration
  def change
    add_index :snippets, :token, unique: true
  end
end
