
module FeedbacksHelper

  def feedbackable_link(feedbackable)
    link_to feedbackable.title,
      feedbackable
  end

end
