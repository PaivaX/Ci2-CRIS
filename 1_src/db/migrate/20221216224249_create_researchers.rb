class CreateResearchers < ActiveRecord::Migration[7.0]
  def change
    create_table :researchers do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :user_type
      t.date :birthday
      t.text :resume
      t.string :email
      t.string :website
      t.string :degree
      t.integer :project_id
      t.timestamps
    end
  end
end
