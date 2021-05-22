class Item < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :image, presence: true
  validates :condition_id, numericality: { other_than: 1 } 
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :period_id , presence: true
  validates :price, presence: true

  belongs_to :user
  has_one_attached :image
  #has_one :order
  #has_many :comments
  #has_many :favorites
  #has_many :warnings

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :postage
  belongs_to :prefecture

end
