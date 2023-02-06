class Researcher < ApplicationRecord
    validates :name, presence: true
    has_one_attached :avatar
    Degree = ['Licence', 'Master', 'Doctorate']
    has_and_belongs_to_many :articles
end 