require 'rails_helper'

RSpec.describe "users/profiles/new", type: :view do
  before(:each) do
    assign(:users_profile, Users::Profile.new())
  end

  it "renders new users_profile form" do
    render

    assert_select "form[action=?][method=?]", users_profiles_path, "post" do
    end
  end
end
