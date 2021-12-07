class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # One to many to Collections table
  has_many :recipes, dependent: :destroy
  has_many :collections
  has_many :recipes_in_collection, through: :collections, source: :recipe
end
