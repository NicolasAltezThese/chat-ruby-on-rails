require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST create" do
    context "with valid parameters" do
      it "creates a new message" do
        expect {
          post :create, params: { message: { content: "Hola" } }
        }.to change(Message, :count).by(1)
      end

      it "redirects to the index page" do
        post :create, params: { message: { content: "Hola" } }
        expect(response).to redirect_to(messages_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new message" do
        expect {
          post :create, params: { message: { content: nil } }
        }.not_to change(Message, :count)
      end

      it "renders the index template" do
        post :create, params: { message: { content: nil } }
        expect(response).to render_template(:index)
      end
    end
  end
end
