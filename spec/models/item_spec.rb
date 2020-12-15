require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end


 describe '商品 新規登録' do

    context '新規登録 正常系' do
      it '全項目が入力されていたら、登録できる' do
      expect(@item).to be_valid
      end
   end

    context '商品 新規登録 異常系' do
        it "商品画像を1枚つけることが必須であること" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include "Image can't be blank"
        end

        it "商品名が必須であること" do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Name can't be blank"
        end

        it "商品の説明が必須であること" do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Description can't be blank"
        end

        it "カテゴリーの情報が必須であること" do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Category can't be blank"
        end

        it "商品の状態についての情報が必須であること" do
          @item.condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Condition can't be blank"
        end

        it "配送料の負担についての情報が必須であること" do
          @item.fee_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Fee can't be blank"
        end

        it "発送元の地域についての情報が必須であること" do
          @item.region_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Region can't be blank"
        end

        it "発送までの日数についての情報が必須であること" do
          @item.shipping_days_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Shipping days can't be blank"
        end

        it "価格についての情報が必須であること" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Price can't be blank"
        end

        it '販売価格は半角数字のみ保存可能であること' do
          @item.price = '１２３４５'
          @item.valid?
          expect(@item.errors.full_messages).to include "Price is not a number"
        end

        it "価格の範囲が、¥300~¥9,999,999の間であること" do
          @item.price = 200
          @item.valid?
          expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
        end

        it "価格の範囲が、¥300~¥9,999,999の間であること" do
          @item.price = 1000000000
          @item.valid?
          expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
        end

        it 'カテゴリーのactive_hashで実装するものについては「1では登録できない」' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Pulldown must exist"
        end

        it '商品の状態のactive_hashで実装するものについては「1では登録できない」' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Pulldown must exist"
        end

        it '配送料の負担のactive_hashで実装するものについては「1では登録できない」' do
          @item.fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Pulldown must exist"
        end

        it '発送元の地域のactive_hashで実装するものについては「1では登録できない」' do
          @item.region_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Pulldown must exist"
        end

        it '発送までの日数のactive_hashで実装するものについては「1では登録できない」' do
          @item.shipping_days_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include "Pulldown must exist"
        end
    end
  end
end