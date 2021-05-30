class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :period_id
  end
  
  validates :price,  presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

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
  belongs_to :period

end
