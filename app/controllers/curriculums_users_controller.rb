class CurriculumsUsersController < ApplicationController
  def create
    @curriculums_user = CurriculumsUser.new( curriculum_id: params[:curriculum_id],
                                                     user_id:   params[:user_id])

    @curriculums_user.save

    flash[:success] = "Added to Your Curriculums"
    redirect_to request.referer
  end

  def destroy
    @curriculums_user = CurriculumsUser.find_by( id: params[:id] )

    @curriculums_user.destroy
    flash[:success] = "Removed From Your Curriculums"
    redirect_to request.referer
  end
end
