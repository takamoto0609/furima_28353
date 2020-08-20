require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録がうまくいくとき' do
      it "名前、メールアドレス、パスワード、ユーザー本名、ユーザー本名フリガナ、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      # パスワードは6文字以上であること
      # パスワードは半角英数字混合であること
      it "passwordが6文字以上・半角英数字混合であれば登録できる" do
        @user.password = "abab00"
        @user.password_confirmation = "abab00"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      # ニックネームが必須であること
      it "nicknameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      # メールアドレスが必須であること
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      # メールアドレスが一意性であること
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      # メールアドレスは@を含む必要があること
      it "emailに＠が含まれない場合は登録できない" do
        @user.email = "ababab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      # パスワードが必須であること
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      # パスワードは6文字以上であること
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      # パスワードは半角英数字混合であること
      it "passwordが半角英数混合でなければ登録できない" do
        @user.password = "ababab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数の両方を含めて設定してください。")
      end
      # パスワードは確認用を含めて2回入力すること
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      # ユーザー本名が、名字と名前がそれぞれ必須であること　空と全角はまとめられるかも
      it "ユーザー本名の名字が空だと登録できない" do
        @user.first_name_kannji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kannji can't be blank")
      end
      it "ユーザー本名の名前が空だと登録できない" do
        @user.last_name_kannji = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kannji can't be blank")
      end
      # ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
      it "ユーザー本名の名字が全角でないと登録できない" do
        @user.first_name_kannji = "ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kannji は全角で入力してください。")
      end
      it "ユーザー本名の名前が全角でないと登録できない" do
        @user.last_name_kannji = "ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kannji は全角で入力してください。")
      end
      # ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること　空と全角はまとめられるかも
      it "ユーザー本名の名字フリガナが空だと登録できない" do
        @user.first_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it "ユーザー本名の名前フリガナが空だと登録できない" do
        @user.last_name_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      # ユーザー本名のフリガナは全角（カタカナ）で入力させること
      it "ユーザー本名の名字フリガナが全角でないと登録できない" do
        @user.first_name_katakana = "ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana は全角カタカナで入力して下さい。")
      end
      it "ユーザー本名の名前フリガナが全角でないと登録できない" do
        @user.last_name_katakana = "ab"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana は全角カタカナで入力して下さい。")
      end
      # 生年月日が必須であること
      it "生年月日が空だと登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

    end

  end

end