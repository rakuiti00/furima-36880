require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id,item_id: item.id)
      sleep 0.1
    end

    context '購入情報の内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_destination).to be_valid
      end

      it 'building_nameは空でも登録できること' do
        @purchase_destination.building_name = ""
        expect(@purchase_destination).to be_valid
      end
    end

    context '購入情報の内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_destination.postal_code = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが3-4桁でないと登録できないこと' do
        @purchase_destination.postal_code = "58-12345"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeが半角数値でないと登録できないこと' do
        @purchase_destination.postal_code = "５８０ー００１１"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeがハイフンなしでは登録できないこと' do
        @purchase_destination.postal_code = "5801234"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code is invalid")
      end

      it 'shipping_area_idが---では登録できないこと' do
        @purchase_destination.shipping_area_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'cityが空では登録できないこと' do
        @purchase_destination.city = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では登録できないこと' do
        @purchase_destination.address = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では登録できないこと' do
        @purchase_destination.phone_number = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁では登録できないこと' do
        @purchase_destination.phone_number = "123456789"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12桁では登録できないこと' do
        @purchase_destination.phone_number = "123456789012"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberがハイフンがあると登録できないこと' do
        @purchase_destination.phone_number = "080-0123-3133"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが全角では登録できないこと' do
        @purchase_destination.phone_number = "０８０３１３３１２３４"
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end

      it 'トークンが生成されていないと登録できないこと' do
        @purchase_destination.token = ""
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end

end
