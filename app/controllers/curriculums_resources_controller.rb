
class CurriculumsResourcesController < ApplicationController

  def create
    @curriculums_resource = CurriculumsResource.new( curriculum_id: params[:curriculum_id],
                                                     resource_id:   params[:resource_id])

    @curriculums_resource.save
    redirect_to request.referer
  end

  def destroy
    @curriculums_resource = CurriculumsResource.find_by( id: params[:id] )

    @curriculums_resource.destroy
    redirect_to request.referer
  end
end
