require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '内容に問題ない場合' do

  end


  context '内容に問題がある場合' do


  describe "ユーザー新規登録" do
    it "ニックネーム必須" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレス必須" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレス一意性" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it "@がないと登録できない" do
      @user.email = 'absdcom'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワード必須" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワード6文字以上" do
      @user.password = 'a0000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it "パスワード半角数値のみはNG" do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "パスワード半角英字のみNG" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "パスワード全角英数混合NG" do
      @user.password = 'ＡＤＤＡＯＥ７３２０８０'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "パスワード2回一致" do
      @user.password = 'a00000'
      @user.password_confirmation = 'b00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名（名字）必須" do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank", "Last name kanji is invalid")
    end

    it "ユーザー本名（名前）必須" do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank", "First name kanji is invalid")
    end
    
    it "ユーザー本名 全角指定（名字）" do
      @user.last_name_kanji = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kanji is invalid')
    end

    it "ユーザー本名 全角指定（名前）" do
      @user.first_name_kanji = 'ﾀｶｼ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
    end

    it "ユーザー本名（カナ名字）必須" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
    end

    it "ユーザー本名（カナ名前）必須" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    
    it "ユーザー本名 全角指定（カナ名字）" do
      @user.last_name_kana = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it "ユーザー本名 全角指定（カナ名前）" do
      @user.first_name_kana = 'ﾀｶｼ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it "生年月日必須" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    
  end

  end
end