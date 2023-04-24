require "rails_helper"

RSpec.describe UserMail, type: :model do
  let(:user_mail) { FactoryBot.build(:user_mail) }

  describe "Field validation" do
    context "All field Present" do
      it "User should save" do 
        expect(user_mail.save).to eq(true)
      end
    end

    context "Missing all field" do
      it "User not ne save" do 
        user = UserMail.new()
        expect(user.save).to eq(false)
      end
    end

    context "Missing name field" do
      it "User not ne save" do 
        user = UserMail.new(
          email: Faker::Internet.email,
          image: user_mail.image
        )
        expect(user.save).to eq(false)
      end
    end

    context "Missing Image field" do
      it "User not be save" do 
        user = UserMail.new(
          name: Faker::Name.name,
          email: Faker::Internet.email
        )
        expect(user.save).to eq(false)
      end
    end

    context "Missing email field" do
      it "User not be save" do 
        user = UserMail.new(
          name: Faker::Name.name,
          image: user_mail.image
        )
        expect(user.save).to eq(false)
      end
    end

  end

end
