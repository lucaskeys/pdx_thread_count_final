class Article < ActiveRecord::Base
  belongs_to :tag
  has_many :article_stores, optional: true
end
