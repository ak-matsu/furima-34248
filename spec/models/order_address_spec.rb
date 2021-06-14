require 'rails_helper'

describe OrderAddress, type: :model do

  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '内容に問題ない場合' do
      # it "priceがあれば保存ができること" do
      #   expect(@orderaddress).to be_valid
      # end
    end

    context '内容に問題がある場合' do
      it "postnumが空では保存ができないこと" do
        @order_address.postnum = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postnum can't be blank")
      end
    end
  end
end