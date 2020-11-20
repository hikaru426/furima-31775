class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :price, inclusion: { in: 300..9_999_999 }
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :prefecture_id
    validates :delivery_id
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_id
    validates :prefecture_id
    validates :delivery_id
  end

  with_options format: { with: /^[0-9]+$/, message: '半角数字のみ入力してください' } do
    :price
  end
end
