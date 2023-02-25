class Institution < ApplicationRecord
  #has_many :projects
  has_one_attached :image
  validates :name, presence: true

  has_and_belongs_to_many :researchers
  validates :name, :description, :url, :image, :partner, presence: true
end
