require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    # インスタンスを生成
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '登録する全ての情報が正しい場合、登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end

      it '＠が含まれていないと登録できない' do
        @user.email = "test1com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = "pas01"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが全角英数字のみでは登録できない' do
        @user.password = "TEST００１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "111111"
        @user.password_confirmation = "222222"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameが半角では登録できない' do
        @user.family_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it 'family_nameがアルファベットでは登録できない' do
        @user.family_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが半角では登録できない' do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'first_nameがアルファベットでは登録できない' do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kanaが半角では登録できない' do
        @user.family_name_kana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it 'family_name_kanaがひらがなでは登録できない' do
        @user.family_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = "ﾀﾛｳﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'first_name_kanaがひらがなでは登録できない' do
        @user.first_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'birth_dayが空では登録できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

    end


  end

end
