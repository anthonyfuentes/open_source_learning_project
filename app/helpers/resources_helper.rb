
module ResourcesHelper

  def first_link(resource)
    unless resource.links.empty?
      link_to("link", resource.links.first.url)
    else
      # TODO make this a link for users to add link to resource
      "Can you link this?"
    end
  end

  def media_type(resource)
    Resource.media_types.keys.map(&:humanize)[resource.media_type]
  end

  def resource_url( resource )
    if resource.url
      link_to "Go to Resource",
        resource.url,
        class: "btn btn-primary pull-right"
    else
      # TODO make this a link for users to add link to resource
      "Can you link this?"
    end
  end

  def mark_complete_button(resource)
    return unless resource.is_a?(Resource)
    if current_user && !current_user.completed?(resource)
      link_to "✓ Mark Complete",
        new_resource_feedback_path(resource),
        class: 'btn btn-success'
    elsif current_user
      link_to "✕ Un-Complete",
        resource_feedback_path(resource,
                               params: {feedbackable_type: "Resource",
                               feedbackable_id: resource.id}),
        class: 'btn btn-default',
        method: :delete
    end
  end

end
