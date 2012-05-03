require 'spec_helper'
include DreamHelper

describe Dream do
  describe "can be" do
    let(:dream) { Fabricate(:dream) }
    let(:new_dream) { Fabricate.build(:dream) }

    it "created" do
      visit new_dream_path
      fill_in_dream(new_dream)
      expect { click_button 'Create Dream' }.to change { Dream.count }.by(1)
      Dream.order('created_at').last.title.should == new_dream.title
    end

    it "read" do
      visit dream_path(dream)
      page.should have_content dream.title
      page.should have_content dream.description
      page.should have_content dream.votes
    end

    it "updated" do
      visit edit_dream_path(dream)
      find('#dream_title').value.should == dream.title
      page.should have_content dream.description
      fill_in_dream(new_dream)
      expect { click_button 'Update Dream' }.to change { Dream.count }.by(0)
      page.should have_content new_dream.title
      page.should have_content new_dream.description
    end

    it "destroyed"
  end

  pending "can't be" do
    it "updated by another user unless they're an admin"
    it "destroyed by another user unless they're an admin"
  end
end
