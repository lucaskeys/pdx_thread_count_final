class Designer < ActiveRecord::Base
  has_many :designer_stores
  has_many :stores, through: :designer_stores

  has_attached_file :designer_image, styles: { large: "1000x1000>", :thumb => "100x100>" }
  validates_attachment_content_type :designer_image, content_type: /\Aimage\/.*\z/
end
