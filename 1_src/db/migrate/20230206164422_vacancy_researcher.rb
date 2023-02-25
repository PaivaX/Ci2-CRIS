class VacancyResearcher < ActiveRecord::Migration[7.0]
  def change
    create_table :researchers_vacancies do |t|
      t.belongs_to :researcher, null:false, foreign_key:true
      t.belongs_to :vacancy, null:false, foreign_key:true
    end
  end
end
