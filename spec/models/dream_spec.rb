require 'spec_helper'

describe Dream do
  let(:new_dream) { Fabricate.build(:dream) }
  it "can't be created without a title" do
    new_dream.title = ''
    new_dream.save
    new_dream.should be_new_record
    new_dream.errors.count.should > 0
  end

  it "can't be created without a description" do
    new_dream.description = ''
    new_dream.save
    new_dream.should be_new_record
    new_dream.errors.count.should > 0
  end
end
