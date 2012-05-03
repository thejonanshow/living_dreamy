module DreamHelper
  def fill_in_dream(dream)
    fill_in "dream_title", :with => dream.title
    fill_in "dream_description", :with => dream.description
  end
end
