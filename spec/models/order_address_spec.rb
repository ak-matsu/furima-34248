require 'rails_helper'

describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)

    @user.save
    @item.save
    @order_address = FactoryBot.build(:order_address,user_id: @user.id, item_id: @item.id)
    # FactoryBot.build(:order_address, 外部キー: userのid, 外部キー: itemのid)
  end

  #正常テスト
  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it "商品購入できるとき" do
        expect(@order_address).to be_valid
      end
    end

    #異常テスト
    context '内容に問題がある場合' do
      it "postnumが空では保存ができないこと" do
        @order_address.postnum = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postnum can't be blank")
      end
    end
  end
end