class AddTokenToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :token, :string
  end
end
