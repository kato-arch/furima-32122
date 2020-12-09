require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録 正常系' do
     it '全項目が入力されていたら、登録できる' do
     expect(@user).to be_valid
     end

     it 'パスワードが６文字以上(半角英数字混合)の場合、登録できる' do
     @user.password = 'pass1234'
     @user.password_confirmation = 'pass1234'
     expect(@user).to  be_valid
     end
   end

   context '新規登録 異常系' do
     it "ニックネームが必須であること" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank"
     end

     it "メールアドレスが必須であること" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
     end

     it "メールアドレスが一致していたら登録できない" do
      @user.email ='test123@test.com'
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = 'test123@test.com'
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
     end

     it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
     end

     it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end


     it "パスワードは、確認用を含めて2回入力すること" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
    
     it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password = '12345a'
      @user.password_confirmation = '1234567a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end

     it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
     end

     it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
     end

     it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
     end

     it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
     end

     it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name_kana = ''
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank", "Last name kana can't be blank"
     end

     it "生年月日が必須であること" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
     end
   end



   
  end
end
