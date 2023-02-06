class CreateArticlesProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_projects do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.belongs_to :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
