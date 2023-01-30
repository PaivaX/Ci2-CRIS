class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
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
      t.string :name_program
      t.string :amount_program
      t.string :grant_number
      t.string :url_project

      t.timestamps
    end
  end
end
