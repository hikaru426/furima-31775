class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery
  belongs_to :shipping
  belongs_to :prefecture

  has_one_attached :image
  

  with_options presence: true do
    validates :name
    validates :info
    validates :price, inclusion: { in: 300..9_999_999 }
    validates :image
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :prefecture_id
    validates :delivery_id
  end
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
end
