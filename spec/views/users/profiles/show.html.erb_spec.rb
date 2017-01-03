require 'rails_helper'

RSpec.describe "users/profiles/show", type: :view do
  before(:each) do
    @users_profile = assign(:users_profile, Users::Profile.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
