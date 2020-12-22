require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order_address = FactoryBot.build(:order_address)
  end


  describe '商品購入機能テスト' do

    context '商品購入 正常系' do
      it '全項目が入力されていたら、登録できる' do
        expect(@order_address).to be_valid
      end
      it '建物名の入力がなくても、保存できる' do
        @order_address.building_number = nil
        expect(@order_address).to be_valid
      end
   end

    context '商品購入 異常系' do        
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと保存できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号はハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.postal_code = "1234567" 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が選択されていないと保存できない' do
        @order_address.region_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region must be other than 1")
      end

      it '市区町村が空では保存できない' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地は空では保存できない' do
        @order_address.address_line = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line can't be blank")
      end

      it '電話番号が空だと保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号はハイフンが入っていると保存できない' do
        @order_address.phone_number = "090-1234-5678" 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は11文字以内でないと保存できない' do
        @order_address.phone_number = "090123456789" 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は半角英語では登録できない' do
        @order_address.phone_number = "aaabbbbcccc" 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'user_idが空では登録できない' do
        @order_address.user_id = "" 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @order_address.item_id = "" 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end