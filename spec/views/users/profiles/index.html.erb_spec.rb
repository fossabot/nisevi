require 'rails_helper'

RSpec.describe "users/profiles/index", type: :view do
  before(:each) do
    assign(:users_profiles, [
      Users::Profile.create!(),
      Users::Profile.create!()
    ])
  end

  it "renders a list of users/profiles" do
    render
  end
end
