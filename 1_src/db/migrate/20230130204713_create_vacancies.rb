class CreateVacancies < ActiveRecord::Migration[7.0]
  def change
    create_table :vacancies do |t|
      t.string :reference
      t.string :position
      t.text :requirement
      t.date :deadline
      t.string :link
      t.string :euraxess
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
