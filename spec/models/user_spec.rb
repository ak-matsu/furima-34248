require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', encrypted_password: '0000000', password_confirmation: '0000000',sei_zen:'春',mei_zen:'麗',sei_kana:'チュン',mei_kana:'リー',birthday:'19680301')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")

    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'chun', email: '', encrypted_password: '0000000', password_confirmation: '0000000',sei_zen:'春',mei_zen:'麗',sei_kana:'チュン',mei_kana:'リー',birthday:'19680301')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'sei_zenが空では登録できない' do
      user = User.new(nickname: 'chun', email: 'test@example', encrypted_password: '0000000', password_confirmation: '0000000',sei_zen:'',mei_zen:'麗',sei_kana:'チュン',mei_kana:'リー',birthday:'19680301')
      user.valid?
      expect(user.errors.full_messages).to include("Sei zen can't be blank")
    end

    it 'mei_zenが空では登録できない' do
      user = User.new(nickname: 'chun', email: 'test@example', encrypted_password: '0000000', password_confirmation: '0000000',sei_zen:'春',mei_zen:'',sei_kana:'チュン',mei_kana:'リー',birthday:'19680301')
      user.valid?
      expect(user.errors.full_messages).to include("Mei zen can't be blank")
    end

    it 'sei_kanaが空では登録できない' do
      user = User.new(nickname: 'chun', email: 'test@example', encrypted_password: '0000000', password_confirmation: '0000000',sei_zen:'春',mei_zen:'麗',sei_kana:'',mei_kana:'リー',birthday:'19680301')
      user.valid?
      expect(user.errors.full_messages).to include("Sei kana can't be blank")
    end

    it 'mei_kanaが空では登録できない' do
      user = User.new(nickname: 'chun', email: 'test@example', encrypted_password: '0000000', password_confirmation: '0000000',sei_zen:'春',mei_zen:'麗',sei_kana:'チュン',mei_kana:'',birthday:'19680301')
      user.valid?
      expect(user.errors.full_messages).to include("Mei kana can't be blank")
    end

    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'chun', email: 'test@example', encrypted_password: '0000000', password_confirmation: '0000000',sei_zen:'春',mei_zen:'麗',sei_kana:'チュン',mei_kana:'リー',birthday:'')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end