class CreateInstitutionsResearchers < ActiveRecord::Migration[7.0]
  def change
    create_table :institutions_researchers do |t|
      t.references :institution, null: false, foreign_key: true
      t.references :researcher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
