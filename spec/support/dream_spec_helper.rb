module DreamHelper
  def fill_in_dream(dream)
    fill_in Dom::Post.title, :with dream.title
  end
end
