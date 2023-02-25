class Vacancy < ApplicationRecord
  belongs_to :project, optional: true
  validates :deadline, presence: true
  has_and_belongs_to_many :researchers
end
