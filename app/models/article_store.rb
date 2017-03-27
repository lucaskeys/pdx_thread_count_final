class ArticleStore < ActiveRecord::Base
  belongs_to :article
  belongs_to :store 
end
