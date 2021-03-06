class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  has_many :orders, dependent: :destroy
  has_many :products, through: :orders
  has_many :purchases
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :photo
end
