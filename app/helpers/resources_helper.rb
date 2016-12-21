module ResourcesHelper
  def first_link(resource)
    unless resource.links.empty?
      link_to("link", resource.links.first.url) 
    else
      "No links for this resource"
    end
  end
end
