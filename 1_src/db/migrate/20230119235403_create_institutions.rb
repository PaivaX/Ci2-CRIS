class CreateInstitutions < ActiveRecord::Migration[7.0]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :url
      t.text :partner

      t.timestamps
    end
  end
end
