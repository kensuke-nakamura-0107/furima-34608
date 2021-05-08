class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

  VALID_PASS_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password , {presence: true, length: { minimum: 6 }, format: { with:  VALID_PASS_REGEX } }
  
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :last_name_kanji , {presence: true, format: { with:  VALID_NAME_REGEX } }
  validates :first_name_kanji, {presence: true, format: { with:  VALID_NAME_REGEX } }

  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, {presence: true, format: { with:  VALID_KANA_REGEX } }
  validates :first_name_kana, {presence: true, format: { with:  VALID_KANA_REGEX } }

  validates :birthday , presence: true


  #validates :nickname, presence: true, length: { maximum: 6 }

  has_many :orders
  has_many :items
  has_many :comments
  has_many :favorites
  has_many :warnings

end
