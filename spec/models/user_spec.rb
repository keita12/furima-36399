require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録に成功する時' do
      it "ニックネームと生年月日が存在すれば保存できる" do
        expect(@user).to be_valid
      end
      it "被っていないメールアドレスなら保存できる" do
        ＠user.email = FactoryBot.build(:user)
        expect(@user).to be_valid
      end
      it "パスワードが半角英数字６文字以上であれば保存できる" do
        @uesr.password = 'keita323'
        expect(@user).to be_valid
      end
      it "パスワードとパスワード確認が同じだと保存できる" do
        @uesr.password = 'keita323'
        @user.password_confirmation = 'keita323'
        expect(@user).to be_valid
      end
      it "名前が全角の時保存できる" do
        @uesr.first_name ='啓太'
        expect(@user).to be_valid
      end
      it "名字が全角の時保存できる" do
        @uesr.last_name = '稲森'
        expect(@user).to be_valid
      end
      it "名前がカタカナの時保存できる" do
        @uesr.katakana_first_name = 'ケイタ'
        expect(@user).to be_valid
      end
      it "名字がカタカナの時保存できる" do
        @uesr.katakana_last_name = 'イナモリ'
        expect(@user).to be_valid
      end
    end

   context '新規登録に失敗する時' do
    it "ニックネームは空では保存できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "メールアドレスは空では保存できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "重複したメールアドレスが存在すると保存できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it "メールアドレスに@が含まれていないと保存できない" do
      @user.email = 'keita323'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end  
    it "パスワードは空では保存できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードが存在してもパスワード確認が空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    it "パスワードは５文字以下だと保存できない" do
      @user.password = 'kkk00'
      @user.password_confirmation = 'kkk00'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it "パスワードは半角英数字混合でないと保存できない" do
      @user.password = 'kkkkkk'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Input full-width characters."
    end
    it "パスワードが半角数字のみでは登録できないこと" do
      @user.password = '777777'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Input full-width characters."
    end
    it "パスワードが全角では登録できないこと" do
      @user.password = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid. Input full-width characters."
    end
    it "パスワードとパスワード確認は値が一致していないと保存できない" do
      @user.password = 'kkkk00'
      @user.password_confirmation = 'kkk000'
      
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "お名前の名字は空では保存できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "お名前の名前は空では保存できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "お名前(全角)の名字は、全角(漢字、ひらがな、カタカナ)で入力されていないと保存できない" do
      @user.last_name = 'keita'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters."
    end
    it "お名前(全角)の名前は、全角(漢字、ひらがな、カタカナ)で入力されていないと保存できない" do
      @user.first_name = 'keita'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
    end
    it "お名前カナの名字は空では保存できない" do
      @user.katakana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Katakana last name can't be blank"
    end
    it "お名前カナの名前は空では保存できない" do
      @user.katakana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Katakana first name can't be blank"
    end
    it "お名前カナ(全角)の名字は、全角(カタカナ)で入力されていないと保存できない" do
      @user.katakana_last_name = 'keita'
      @user.valid?
      expect(@user.errors.full_messages).to include "Katakana last name is invalid. Input full-width katakana characters."
    end
    it "お名前カナ(全角)の名前は、全角(カタカナ)で入力されていないと保存できない" do
      @user.katakana_first_name = 'keita'
      @user.valid?
      expect(@user.errors.full_messages).to include "Katakana first name is invalid. Input full-width katakana characters."
    end
    it "生年月日は空では保存できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end 
end 
end
