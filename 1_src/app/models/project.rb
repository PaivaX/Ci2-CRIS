class Project < ApplicationRecord
    has_one :user
    has_and_belongs_to_many :researchers 
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
    validates :project_role, presence: true
    Project_role = ['Ongoing', 'Completed', 'Cancelled', 'Not funded']
    has_one_attached :avatar
    has_and_belongs_to_many :articles
  end