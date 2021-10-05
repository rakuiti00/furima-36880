require 'rails_helper'

RSpec.describe User, type: :model do
  before do
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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it '＠が含まれていないと登録できない' do
        @user.email = "test1com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = "pas01"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it 'passwordが全角英数字のみでは登録できない' do
        @user.password = "TEST００１"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "111111"
        @user.password_confirmation = "222222"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名字)を入力してください")
      end

      it 'family_nameが半角では登録できない' do
        @user.family_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名字)は不正な値です")
      end

      it 'family_nameがアルファベットでは登録できない' do
        @user.family_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名字)は不正な値です")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名前)を入力してください")
      end

      it 'first_nameが半角では登録できない' do
        @user.first_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名前)は不正な値です")
      end

      it 'first_nameがアルファベットでは登録できない' do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名前)は不正な値です")
      end

      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名字)を入力してください")
      end

      it 'family_name_kanaが半角では登録できない' do
        @user.family_name_kana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名字)は不正な値です")
      end

      it 'family_name_kanaがひらがなでは登録できない' do
        @user.family_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名字)は不正な値です")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名前)を入力してください")
      end

      it 'first_name_kanaが半角では登録できない' do
        @user.first_name_kana = "ﾀﾛｳﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名前)は不正な値です")
      end

      it 'first_name_kanaがひらがなでは登録できない' do
        @user.first_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(名前)は不正な値です")
      end

      it 'birth_dayが空では登録できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

    end


  end

end
