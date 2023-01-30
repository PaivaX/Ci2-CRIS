class Project < ApplicationRecord
    has_many :researcher 
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
    Project_role = ['Ongoing', 'Completed', 'Cancelled', 'Not funded']
    has_one_attached :avatar
  end