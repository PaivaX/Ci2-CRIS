class ArticlesResearcher < ApplicationRecord
  belongs_to :article
  belongs_to :researcher
end
