class Store < ActiveRecord::Base

  has_attached_file :store_image, styles: { large: "1000x1000>", :thumb => "100x100>" }
  validates_attachment_content_type :store_image, content_type: /\Aimage\/.*\z/

  has_many :articles, through: :article_stores
  has_many :article_stores
  has_many :user_stores
  has_many :users, through: :user_stores
  has_many :reviews
  has_many :designer_stores
  has_many :designers, through: :designer_stores
  has_many :store_announcements

end
