require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it '全ての入力内容が問題がなかれば登録することができる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '画像がないときは登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
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

      it 'priceが半角英数字出なければ登録できないこと' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list', 'Price Half-width number')
      end

      it 'priceの価格の範囲が¥300より大きいこと' do
        @item.price = 299
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
end
