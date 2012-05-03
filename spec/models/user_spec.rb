require 'spec_helper'

describe User do
  let(:new_user) { Fabricate.build(:user) }

  it "updates name on creation" do
    new_user.name.should_not == new_user.tap(&:save).name
  end
end
