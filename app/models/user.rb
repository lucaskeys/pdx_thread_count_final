class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save { self.email = email.downcase }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :user_stores
  has_many :stores, through: :user_stores
  has_many :posts
  has_many :reviews, through: :stores


  def store_not_added?(store_id)
    user_stores.where(store_id: store_id).count < 1
  end
end
