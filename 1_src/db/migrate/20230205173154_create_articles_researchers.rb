class CreateArticlesResearchers < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_researchers do |t|
      t.references :article, null: false, foreign_key: true
      t.references :researcher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
