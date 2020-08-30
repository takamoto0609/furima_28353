require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  describe '取引情報の保存' do

    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('test.jpg')
      @item.save
      @user = FactoryBot.create(:user)
      @address_purchase = FactoryBot.build(:address_purchase, user_id: @user.id, item_id: @item.id)
      sleep 1 #処理を少し遅くする
    end

    context '取引情報の保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address_purchase).to be_valid
      end

      it 'building_nameが空でも保存できること' do
        @address_purchase.building_name = nil
        expect(@address_purchase).to be_valid
      end
    end

    context '取引情報の保存がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @address_purchase.postal_code = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @address_purchase.postal_code = '1234567'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Postal code is invalid. Write correctly, need hyphen")
      end  

      it 'municipalitiesが空だと保存できないこと' do
        @address_purchase.municipalities = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Municipalities can't be blank")
      end
      
      it 'addressが空だと保存できないこと' do
        @address_purchase.address = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @address_purchase.phone_number = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberがハイフンを含まない正しい形式でないと保存できないこと' do
        @address_purchase.phone_number = '123-4567'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number is invalid. Exclude hyphen(-)")
      end

      it 'phone_numberが11桁以内でないと保存できないこと' do
        @address_purchase.phone_number = '123456789012'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Phone number is invalid. Exclude hyphen(-)")
      end
        
      it 'shipping_area_idが空だと保存できないこと' do
        @address_purchase.shipping_area_id = '1'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Shipping area Select")
      end
    end

  end

end