
module ApplicationHelper

  def display_time
    return "Time to Complete\nNot Yet Rated" if feedbackable.feedbacks.empty?

    if completion_time < 60
      "~#{completion_time} mins"
    else
      completion_time /= 60
      "~#{completion_time} hrs"
    end
  end
  
  def display_tags(taggable) # TODO: is taggable the right name here?
    tag_names = taggable.tags.map { |tag| tag.name }
    tag_names.join(', ')
  end

end
