require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    # 正常系テスト
    context 'ユーザー新規登録ができるとき' do
      it 'nicknameが登録できるとき' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end

      it 'emailが登録できるとき' do
        @user.email = 'test@test.com'
        expect(@user).to be_valid
      end

      it 'passwordが登録できるとき' do
        @user.password
        expect(@user).to be_valid
      end

      it 'password確認' do
        @user.password_confirmation
        expect(@user).to be_valid
      end

      it 'sei_zenが登録できる' do
        @user.sei_zen = '山'
        expect(@user).to be_valid
      end

      it 'mei_zenが登録できる' do
        @user.mei_zen = '田'
        expect(@user).to be_valid
      end

      it 'sei_kanaが登録できる' do
        @user.sei_kana = 'ヤマ'
        expect(@user).to be_valid
      end

      it 'mei_kanaが登録で来る' do
        @user.mei_kana = 'ダ'
        expect(@user).to be_valid
      end

      it '誕生日が登録できる' do
        @user.birthday = '19680301'
        expect(@user).to be_valid
      end
    end

    # 異常系テスト
    context 'ユーザー登録が失敗するとき' do
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
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      # メールアドレスは、@を含む必要があること
      it 'emailに@が含まれていない場合登録できない ' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aaa12'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角数字だけでは登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角英数以外のものだとエラーになる' do
        @user.password = '123abcあいう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'sei_zenが空では登録できない' do
        @user.sei_zen = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei zen can't be blank")
      end

      it 'sei_zenが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.sei_zen = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sei zen is invalid')
      end

      it 'mei_zenが空では登録できない' do
        @user.mei_zen = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei zen can't be blank")
      end

      it 'mei_zenが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.mei_zen = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Mei zen is invalid')
      end

      it 'sei_kanaが空では登録できない' do
        @user.sei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Sei kana can't be blank")
      end

      it 'sei_kanaが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.sei_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Sei kana is invalid')
      end

      it 'mei_kanaが空では登録できない' do
        @user.mei_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Mei kana can't be blank")
      end

      it 'mei_kanaが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.mei_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Mei kana is invalid')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
