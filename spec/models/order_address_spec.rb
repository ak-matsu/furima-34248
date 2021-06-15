require 'rails_helper'

describe OrderAddress, type: :model do

# before内に  user,itemをDBに保存する
# そのid番号を用いて@order_addressを作成する。

  before do
    @order_address = FactoryBot.build(:order_address)
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