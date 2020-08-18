require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、last_name,first_name,last_katakana,first_katakana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000kkk"
        @user.password_confirmation = "000kkk"
        expect(@user).to be_valid
      end
    end
    

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")

      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに＠がないと登録できない" do
        @user.email = "kkkkk.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "qqq00"
        @user.password_confirmation = "qqq00"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが数字のみだと登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Input half_width characters")
      end

      it "passwordが英字のみだと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Input half_width characters")
      end
      
     

      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end

      it "last_nameが半角英数字では登録できない" do
        @user.last_name = "hja"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it "first_nameが半角英数字では登録できない" do
        @user.first_name = "hjaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it "last_katakanaが空では登録できない" do
        @user.last_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last katakana is invalid. Input full-width katakana.")
      end

      it "first_katakanaが空では登録できない" do
        @user.first_katakana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First katakana is invalid. Input full-width katakana.")
        
      end
      it "first_katakanaがカタカナでないと登録できない" do
        @user.first_katakana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("First katakana is invalid. Input full-width katakana.")
        
      end

      it "last_katakanaがカタカナでないと登録できない" do
        @user.last_katakana = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last katakana is invalid. Input full-width katakana.")
      end

      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
        
      end


    end
    
  end 
end