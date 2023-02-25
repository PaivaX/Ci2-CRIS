class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :institution, foreign_key: true
  end
  def change
    create_table :projects do |t|
      t.references :researcher, foreign_key: true
      t.string :title
      t.text :description
      t.string :project_role
      t.string :avatar
      t.date :start_date
      t.date :end_date
      t.string :funding_type
      t.date :fund_start_date
      t.date :fund_end_date
      t.string :funding_entity
      t.string :funding_program
      t.string :name_program
      t.float :total_budget
      t.float :local_budget
      t.string :grant_number
      t.string :url_project
      t.string :researcher
      t.string :relationship

      t.timestamps
    end
  end
end
