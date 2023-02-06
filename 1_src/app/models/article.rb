class Article < ApplicationRecord
    validates :title, presence: true
    validates :abstract, length: {minimum: 15}
    has_and_belongs_to_many :projects
    has_and_belongs_to_many :researchers
end
