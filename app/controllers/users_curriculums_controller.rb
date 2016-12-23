
class UsersCurriculumsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @user_curriculums = Curriculum.where(creator_id: @user.id)
      .paginate(page: params[:page], per_page: 4)
  end

end
