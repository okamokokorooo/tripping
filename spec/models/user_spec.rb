require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "is invalid without an email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "is invalid with a duplicate email" do
    FactoryBot.create(:user, email: "test@example.com")
    user = FactoryBot.build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "is invalid with an invalid email" do
    user = FactoryBot.build(:user, email: "okamotokokoro")
    user.valid?
    expect(user.errors[:email]).to include("のフォーマットが不適切です")
  end

  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  it "is invalid when the password is short" do
    user = FactoryBot.build(:user, password: "abc12")
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  it "is invalid when the password is long" do
    user = FactoryBot.build(:user, password: "A12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678")
    user.valid?
    expect(user.errors[:password]).to include("は128文字以内で入力してください")
  end

  it "is invalid with a password only with alphabets" do
    user = FactoryBot.build(:user, password: "okamotokokoro")
    user.valid?
    expect(user.errors[:password]).to include("には英字と数字の両方を含めてください")
  end

  it "is invalid without a password confirmation" do
    user = FactoryBot.build(:user, password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("を入力してください")
  end

  it "is invalid when the confirmed password doesn't match" do
    user = FactoryBot.build(:user, password: "hoge1234", password_confirmation: "huga5678")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end
end