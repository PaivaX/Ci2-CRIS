class Institution < ApplicationRecord
  has_one_attached :image
  validates :name, :description, :url, :image, :partner, presence: true
end
