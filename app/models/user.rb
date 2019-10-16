class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :programs
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :like_programs, through: :likes, source: :program

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,presence: true
  validates :name, presence:true
  validates :password, presence: true, length: { minimum: 6 }  #7文字以上
  validates :password_confirmation, presence: true, length: { minimum: 6 } #7文字以上
end
