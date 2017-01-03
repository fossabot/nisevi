require 'rails_helper'

RSpec.describe "users/profiles/edit", type: :view do
  before(:each) do
    @users_profile = assign(:users_profile, Users::Profile.create!())
  end

  it "renders the edit users_profile form" do
    render

    assert_select "form[action=?][method=?]", users_profile_path(@users_profile), "post" do
    end
  end
end
