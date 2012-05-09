class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    usei=User.all.sort_by(&:username)
    @users = usei.paginate(:page => params[:page], :per_page =>30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects }

    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  
end