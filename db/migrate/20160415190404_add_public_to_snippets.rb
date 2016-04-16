class AddPublicToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :public, :boolean, default: true
  end
end
