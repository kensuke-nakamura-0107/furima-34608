class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}

  VALID_PASS_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password , {length: { minimum: 6 }, format: { with:  VALID_PASS_REGEX } }
  
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
  validates :last_name_kanji , {format: { with:  VALID_NAME_REGEX } }
  validates :first_name_kanji, {format: { with:  VALID_NAME_REGEX } }

  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, {format: { with:  VALID_KANA_REGEX } }
  validates :first_name_kana, {format: { with:  VALID_KANA_REGEX } }

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :last_name_kanji
    validates :first_name_kanji
    validates :last_name_kana
    validates :first_name_kana
    validates :birthday
  end


  #validates :nickname, presence: true, length: { maximum: 6 }

  #has_many :orders
  #has_many :items
  #has_many :comments
  #has_many :favorites
  #has_many :warnings

end
