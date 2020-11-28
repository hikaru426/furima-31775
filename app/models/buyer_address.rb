class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: '郵便番号にはハイフンを含んでください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '電話番号は数字のみ出ないと（ハイフンが含まれていると）登録できない' }
    validates :token
  end

  # 「住所」の都道府県に関するバリデーション
  validates :prefecture_id, numericality: { other_than: 0, message: '都道府県を選択してください' }
  def save
    @buyer_id = Buyer.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Place.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, buyer_id: @buyer_id)
    # 寄付金の情報を保存
  end
end
