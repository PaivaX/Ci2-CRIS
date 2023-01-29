class Article < ApplicationRecord
    validates :title, presence: true
    validates :abstract, length: {minimum: 15}
    belongs_to :project
end
