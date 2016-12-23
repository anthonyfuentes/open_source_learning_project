
class UsersCurriculumsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @user_curriculums = @user.all_curriculums_paginated( params[:page] )
  end

end
