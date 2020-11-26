require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 0.1
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, item_id: item.id)
    end

    it 'クレジットカード情報と郵便番号・都道府県・市区町村・番地・電話番号が存在すれば登録できる' do
      expect(@buyer_address).to be_valid
    end

    it '郵便番号が空では登録できない' do
      @buyer_address.postal_code = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にはハイフンがなければ登録できない' do
      @buyer_address.postal_code = '6893101'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Postal code 郵便番号にはハイフンを含んでください')
    end

    it '都道府県が空では登録できない' do
      @buyer_address.city = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("City can't be blank")
    end

    it '市区町村が空では登録できない' do
      @buyer_address.address = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空では登録できない' do
      @buyer_address.phone_number = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号にはハイフンは不要で、11桁以内でなければ登録できない' do
      @buyer_address.phone_number = '123-12345678'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone number 電話番号はハイフンなしの11桁以内で入力してください')
    end
  end
end
