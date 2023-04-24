require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'Creating and checking Mail' do
    let(:user_creation) { FactoryBot.create(:user_mail) }
    let(:new_mail) { UserMailer.welcome_mail(user_creation) }
    

    it 'Check emails( Send and To )' do
      expect(new_mail.from.to_s).to match("ladkishan12345@gmail.com")
      expect(new_mail.to.to_s).to match(user_creation.email)
    end

    it "Check subject" do
      expect(new_mail.subject).to eq("Welcome Email")
    end

    it "Check user's name in body" do
      expect(new_mail.body.encoded).to match(user_creation.name)
    end
  end

  describe "Updating and checking Mail" do
    let(:user) { @user = FactoryBot.create(:user_mail) }
    let(:updating_mail) { @mail = UserMailer.update_mail(user) }

    it 'Check updated emails( Send and To )' do
      user.update(email: Faker::Internet.email)
      expect(updating_mail.from.to_s).to match("ladkishan12345@gmail.com")
      expect(updating_mail.to.to_s).to match(user.email)
    end

    it "Check updated subject" do
      user.update(email: Faker::Internet.email)
      expect(updating_mail.subject).to eq("Changing email")
    end

    it "Check updated user's name in body" do
      user.update(name: "Demo Name")
      expect(updating_mail.body.encoded).to match(user.name)
    end
  end
end
