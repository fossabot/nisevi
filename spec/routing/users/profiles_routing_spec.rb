require "rails_helper"

RSpec.describe Users::ProfilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/users/profiles").to route_to("users/profiles#index")
    end

    it "routes to #new" do
      expect(:get => "/users/profiles/new").to route_to("users/profiles#new")
    end

    it "routes to #show" do
      expect(:get => "/users/profiles/1").to route_to("users/profiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/users/profiles/1/edit").to route_to("users/profiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/users/profiles").to route_to("users/profiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users/profiles/1").to route_to("users/profiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users/profiles/1").to route_to("users/profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users/profiles/1").to route_to("users/profiles#destroy", :id => "1")
    end

  end
end
