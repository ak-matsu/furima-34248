require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    # 正常テスト
    context '出品できるとき' do
      it '出品画像が投稿できるとき' do
        @item.image
        expect(@item).to be_valid
      end

      it '商品名が入力される' do
        @item.name
        expect(@item).to be_valid
      end

      it '商品の説明が入力される' do
        @item.text
        expect(@item).to be_valid
      end

      # 商品の詳細
      it '商品のカテゴリーが選択される' do
        @item.category_id
        expect(@item).to be_valid
      end

      it '商品の状態が選択される' do
        @item.status_id
        expect(@item).to be_valid
      end

      # 配送について
      it '配送料の負担' do
        @item.delivery_money_id
        expect(@item).to be_valid
      end

      it '発送元の地域' do
        @item.prefecture_id
        expect(@item).to be_valid
      end

      it '発送までの日数' do
        @item.delivery_day_id
        expect(@item).to be_valid
      end

      # 販売価格
      it '価格が入力される' do
        @item.price
        expect(@item).to be_valid
      end
    end

    # 異常テスト
    context '出品に失敗するとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it 'カテゴリーが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態が空では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it '発送元の地域が空では登録できない' do
        @item.delivery_money_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery money must be other than 1')
      end

      it '発送までの日数が空では登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
      end

      it '価格が空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '全角数字では登録できないこと' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it '半角英数混合では登録できないこと' do
        @item.price = '123abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it '半角英語だけでは登録できないこと' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it '299円以下では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end

      it '10,000,000以上では登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
