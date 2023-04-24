require "rails_helper"

RSpec.describe "UserMails", type: :request do
  let(:ok_status) { expect(response).to have_http_status(200) }
  let(:valid_params) { @user = FactoryBot.build(:user_mail) }
  let(:invalid_params) {
    @user = FactoryBot.build(
      name: Faker::Name.name,
      email: Faker::Internet.email,
    )
  }

  describe "GET index page" do
    it "Received index page" do
      get "/"
      ok_status
    end
  end

  describe "GET add user page" do
    it "Received add user page" do
      get "/user_mails/new"
      ok_status
    end

    context "Create user with blank data" do
      it "Data should not store" do
        expect {
          post "/user_mails", params: { user_mail: { name: "Jack" } }
        }.to change(UserMail, :count).by(0)
      end
    end

    it "creates a new user with valid data" do
      valid_params.save
      expect(@user.valid?).to eq(true)
    end
  end

  describe "GET edit page" do
    it "Received edit page" do
      valid_params.save
      get "/user_mails/#{@user.id}/edit"
      expect(response.status).to eq(200)
    end

    context "Change in data " do
      it "Data should store" do
        valid_params.save
        patch user_mail_path(@user.id), params: { user_mail: { name: "Demo Name" } }
        @user.reload
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "Delete the user" do
    it "User should deleted" do
      valid_params.save
      expect {
        delete "/user_mails/#{ @user.id }"
      }.to change(UserMail, :count).by(-1)
      expect(response).to redirect_to root_path
    end
  end
end
