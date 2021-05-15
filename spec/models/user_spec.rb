require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")

    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    # メールアドレスが一意性であること
    # 一意性制約は、テーブル内で重複するデータを禁止する制約です
    it '重複したemailが存在する場合登録できない ' do
      @user.save
      another_user = FactoryBot.build(:user,email: @user.email)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    # メールアドレスは、@を含む必要があること


    it 'sei_zenが空では登録できない' do
      @user.sei_zen = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei zen can't be blank")
    end

    it 'mei_zenが空では登録できない' do
      @user.mei_zen = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei zen can't be blank")
    end

    it 'sei_kanaが空では登録できない' do
      @user.sei_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Sei kana can't be blank")
    end

    it 'mei_kanaが空では登録できない' do
      @user.mei_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Mei kana can't be blank")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

