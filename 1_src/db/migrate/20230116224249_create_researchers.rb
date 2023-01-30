class CreateResearchers < ActiveRecord::Migration[7.0]
  def change
    create_table :researchers do |t|
      t.string :name
      t.date :birthday
      t.text :resume
      t.string :email
      t.string :website
      t.string :degree

      t.timestamps
    end
  end
end
