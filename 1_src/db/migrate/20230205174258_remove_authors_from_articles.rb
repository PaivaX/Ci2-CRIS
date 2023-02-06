class RemoveAuthorsFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :authors, :string
  end
end
