require 'rails_helper'

describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    # FactoryBot.build(:order_address, 外部キー: userのid, 外部キー: itemのid)
    sleep(1)
  end

  # 正常テスト
  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it '商品購入できるとき' do
        expect(@order_address).to be_valid
      end

      it '建物が空でも保存できること' do
        @order_address.tower = ''
        expect(@order_address).to be_valid
      end
    end

    # 異常テスト
    context '内容に問題がある場合' do
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号にハイフンが含まれていない場合は登録できないこと' do
        @order_address.postnum = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postnum Postnum can't be blank")
      end

      it 'postnumが空では保存ができないこと' do
        @order_address.postnum = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postnum can't be blank")
      end

      it '住所が未定だと登録できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空白だと登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空白だと登録できない' do
        @order_address.banchi = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Banchi can't be blank")
      end

      it '電話番号が空白だと登録できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end

      it '12桁以上では登録できないこと' do
        @order_address.phone = '090111122223'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it '数字のみでないと登録できないこと（英数字混合）' do
        @order_address.phone = '090abcd2222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it '数字のみでないと登録できないこと（ハイフンあり）' do
        @order_address.phone = '090-1111-2222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it '全角文字では登録できないこと' do
        @order_address.phone = 'あいうえおかきくけこ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end

      it 'Userが紐づいていないと登録できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'Itemが紐づいていないと登録できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
