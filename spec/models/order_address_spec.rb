require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能'
  before do
    @orderaddress = FactoryBot.build(:order_address)
  end

  context '内容に問題ない場合' do
    # it "priceがあれば保存ができること" do
    #   expect(@orderaddress).to be_valid
    # end
  end

  context '内容に問題がある場合' do
    # it "priceが空では保存ができないこと" do
    #   @orderaddress.price = nil
    #   @oorderaddressrder.valid?
    #   expect(@orderaddress.errors.full_messages).to include("Price can't be blank")
    # end
  end
end