class UsersController < ApplicationController

  def show
    @user = User.includes(:submitted_resources).find_by_id(params[:id])
    # TODO: curriculums (later)
  end

end
