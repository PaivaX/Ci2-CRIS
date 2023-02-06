class Researcher < ApplicationRecord
    has_one :user
    has_many :project
    validates :name, presence: true
    has_one_attached :avatar
    Degree = ['Licence', 'Master', 'Doctorate']
    has_and_belongs_to_many :articles
end 