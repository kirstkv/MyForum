class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    usei=User.all.sort_by(&:created_at)
    @users = usei.paginate(:page => params[:page], :per_page =>10)
    @json = User.all.to_gmaps4rails
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
  
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  
end
