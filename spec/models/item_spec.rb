require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end


 describe 'ユーザー新規登録' do

    context '新規登録 正常系' do
      it '全項目が入力されていたら、登録できる' do
      expect(@item).to be_valid
      end

      it '販売価格は半角数字のみ保存可能であること' do
      @item.price = '1234'
      expect(@item).to  be_valid
      end
    end

    context '新規登録 異常系' do
        it "商品画像を1枚つけることが必須であること" do
          @item.image = ''
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
          expect(@item.errors.full_messages).to include "Category_id can't be blank"
        end

        it "商品の状態についての情報が必須であること" do
          @item.condition_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include "Condition_id can't be blank"
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

        it "価格の範囲が、¥300~¥9,999,999の間であること" do
          @item.price = '300<price<9999999'
          @item.valid?
          expect(@item.errors.full_messages).to include ""
        end

        it '販売価格は半角数字のみ保存可能であること' do
          @item.condition_id = '1234a'
          @item.valid?
          expect(@item.errors.full_messages).to include ""
        end
    end
  end
end