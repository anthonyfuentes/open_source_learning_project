
module ApplicationHelper

  def display_tags(taggable) # TODO: is taggable the right name here? 
    tag_names = taggable.tags.map { |tag| tag.name }
    tag_names.join(', ')
  end

end
