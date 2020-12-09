class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


      # 全角ひらがな、全角、カタカナ、漢字
      FORMAT_ZEBKAKU = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
      # 全角カタカナ
      FORMAT_KANA = /\A[ァ-ヶー－]+\z/.freeze
      # 英数字混合
      FORMAT_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

      # パスワード６文字以上
      validates :password, presence: true, length: { minimum: 6 }
      # パスワード 英数字混合
      validates_format_of :password, with: FORMAT_REGEX, message: 'パスワードには半角英数字と半角数字の両方を含めて下さい'

      with_options presence: true do
        # 名前
        validates :name
        # 名字
        validates :last_name, format: { with: FORMAT_ZEBKAKU, message:'全角文字を入力して下さい' }
        # 名前
        validates :first_name, format: { with: FORMAT_ZEBKAKU, message:'全角文字を入力して下さい' }
        # 名字_カナ
        validates :last_name_kana, format: { with: FORMAT_KANA, message:'全角カタカナを入力して下さい' }
        # 名前_カナ
        validates :first_name_kana, format: { with: FORMAT_KANA, message:'全角カタカナを入力して下さい' }
        # 生年月日
        validates :birth_day
    end
end
