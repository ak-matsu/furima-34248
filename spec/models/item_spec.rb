require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/logo.png')

    end

    # 正常テスト
    context '出品できるとき' do
      it '出品画像が投稿できるとき' do
        @item.image = fixture_file_upload('app/assets/images/logo.png')
        expect(@item).to be_valid
      end

    end


    # 異常テスト
    context '出品に失敗するとき' do

    end
  end
end