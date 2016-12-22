module ResourcesHelper

  def first_link(resource)
    unless resource.links.empty?
      link_to("link", resource.links.first.url)
    else
      "No links for this resource"
    end
  end

  def media_type(resource)
    Resource.media_types.keys.map(&:humanize)[resource.media_type]
  end

end
