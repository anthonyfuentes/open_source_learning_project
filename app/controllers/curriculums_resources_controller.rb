
class CurriculumsResourcesController < ApplicationController

  def create
    @curriculums_resource = CurriculumsResource.new()
    @curriculums_resource.save ? successful_create : failed_create
  end

end
