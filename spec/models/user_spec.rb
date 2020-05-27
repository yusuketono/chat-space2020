require 'rails_helper'

describe User do
  describe '#create' do
    it "名前がなければ登録できない" do
      #【注意】カラム名がuserテーブルと一致してないとエラーが出る
      user = build(:user, name:"")
       
      #【解説】valid? は「バリデーションにより保存ができない状態であるか」を確認するメソッド
      user.valid? 

      #【解説】valid？メソッドの返り値はtrue/falseですが、valid?メソッドを利用したインスタンスに対してerrorsメソッドを利用すると、バリデーションにより保存ができない状態である場合なぜできないのかを確認することができます。
      #【注意】カリキュラムでは.include("can't be blank")になっている
      expect(user.errors[:name]).to include("を入力してください")
    end

    # 【参考】模範解答
    it "メールアドレスが存在しなければ登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    
  end
end