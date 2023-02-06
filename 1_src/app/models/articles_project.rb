class ArticlesProject < ApplicationRecord
  belongs_to :project
  belongs_to :article
end
