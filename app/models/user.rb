class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  
  with_options presence: true do
    # ニックネームは必須
    validates :name
    # メールアドレスが必須,一意性である,@を含む必要がある
    validates :email, format: { with: /@.+/, message: "に@を含む必要があります。" }
    # birth_dayが必須
    validates :birth_day
  end

  # パスワードが必須,6文字以上,半角英数字混合,確認用を含めて2回入力
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数の両方を含めて設定してください。'

  # ユーザー本名は必須、全角（漢字・ひらがな・カタカナ）で入力
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"} do
    validates :first_name_kannji
    validates :last_name_kannji
  end
  # ユーザー本名フリガナは必須、全角（カタカナ）で入力
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"} do
    validates :first_name_katakana
    validates :last_name_katakana
  end

end
