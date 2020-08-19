class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, presence: true
    # ニックネームは必須
    # validates :email, format: { with: /@/, message: "に@を含む必要があります。" }
    # メールアドレスが必須,一意性である,@を含む必要がある
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角英数で入力してください。"}
    # パスワードが必須,6文字以上,半角英数字混合,確認用を含めて2回入力
    validates :first_name_kannji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    # ユーザー本名は必須、全角（漢字・ひらがな・カタカナ）で入力
    validates :last_name_kannji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"}
    # ユーザー本名は必須、全角（漢字・ひらがな・カタカナ）で入力
    validates :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
    # 必須、全角（カタカナ）で入力
    validates :last_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
    # 必須、全角（カタカナ）で入力
    validates :birth_day
    # 必須
  end

end
