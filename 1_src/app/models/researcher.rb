class Researcher < ApplicationRecord
    validates :name, presence: true
    has_one_attached :avatar
    Degree = ['Licence', 'Master', 'Doctorate']

end 