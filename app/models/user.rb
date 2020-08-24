class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  
  with_options presence: true do
    validates :name
    validates :email, format: { with: /@.+/, message: "に@を含む必要があります。" }
    validates :birth_day
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数の両方を含めて設定してください。'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください。"} do
    validates :first_name_kannji
    validates :last_name_kannji
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"} do
    validates :first_name_katakana
    validates :last_name_katakana
  end

end
