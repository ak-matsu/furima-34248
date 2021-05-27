require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    # # 正常テスト
    # context '出品できるとき' do
    #   it '出品画像が投稿できるとき' do
    #      @item.image
    #      expect(@item).to be_valid
    #   end

    #   it '商品名が入力される' do
    #     @item.name
    #     expect(@item).to be_valid
    #   end

    # end

    # # 異常テスト
    # context '出品に失敗するとき' do

    #   it 'imageが空では登録できない'do
    #   end

    #   it '商品名が空では登録できない'do
    #   end

    #   it  '商品説明が空では登録できない' do
    #   end

    #   it  'カテゴリーが空では登録できない' do
    #   end

    #   it  '商品の状態が空では登録できない' do
    #   end

    #   it  '発送元の地域が空では登録できない' do
    #   end

    #   it  '発送までの日数が空では登録できない' do
    #   end

    #   it '価格が空だと登録できない' do
    #   end

    # end
  end
end