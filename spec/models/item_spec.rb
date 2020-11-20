require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'nameが空では登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'infoが空では登録できないこと' do
      @item.info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it 'categoryの情報がなければ登録できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end

    it 'conditionの情報がなければ登録できないこと' do
      @item.condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 0')
    end

    it 'shippingの情報がなければ登録できないこと' do
      @item.shipping_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping must be other than 0')
    end

    it 'prefectureの情報がなければ登録できないこと' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
    end

    it 'deleveryの情報がなければ登録できないこと' do
      @item.delivery_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery must be other than 0')
    end

    it 'priceの情報がなければ登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceの価格の範囲が¥300より大きいこと' do
      @item.price = 0 < 300
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it 'priceの価格の範囲が¥9,999,999より小さいこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
  end
end
