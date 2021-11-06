require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '1a3456'
        @user.password_confirmation = '1a3456'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '1a345'
        @user.password_confirmation = '1a345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '123あ56'
        @user.password_confirmation = '123あ56'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it "emailに@とドメインがない場合は登録できないこと " do
        @user.save
        another_user = FactoryBot.build(:user, email: "kkkgmail")
        another_user.valid?
        expect(another_user.errors[:email]).to include("is invalid")
      end

      it "苗字（全角）に半角文字が含まれていると登録できない" do
        @user.last_name = '山ﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "苗字（全角）に半角文字が含まれていると登録できない" do
        @user.first_name = '太ﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "苗字（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない " do
        @user.last_name_kana = '山da'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "名前（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.first_name_kana = '太rou'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
    end
  end
end
