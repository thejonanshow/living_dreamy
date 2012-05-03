require 'spec_helper'

describe Dream do
  describe "it can be" do
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
      page.should have_content "Votes: #{dream.votes}"
    end

    it "updated" do
      old_dream_title = dream.title
      old_dream_description = dream.description
      visit edit_dream_path(dream)
      page.should have_content dream.title
      page.should have_content dream.description
      fill_in_dream(new_dream)
      expect { click_button 'Update Dream' }.to change { Dream.count }.by(0)
      dream.title.should == new_dream.title
      dream.title.should_not == old_dream_title
      dream.description.should == new_dream.description
      dream.description.should_not == old_dream_description
    end

    it "destroyed"
  end

  pending "it can't be" do
    it "updated by another user unless they're an admin"
    it "destroyed by another user unless they're an admin"
  end
end
