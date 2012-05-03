require 'spec_helper'
include UserHelper

describe User do
  let(:user) { Fabricate(:user) }

  it "can create new dreams" do
    login_as(user)
    visit root_path
    page.should have_link 'new_dream'
  end

  it "can't create new dreams unless logged in" do
    visit root_path
    page.should_not have_link 'new_dream'
  end
end
