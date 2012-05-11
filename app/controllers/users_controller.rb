class UsersController < ApplicationController
  before_filter :authenticate_user!
before_filter :check_admin, :except => [:show, :index]
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
  
    def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_path, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def make_admin
    @user = User.find(params[:id])
    @user.admin=true
    @user.save
    redirect_to(users_path, :notice => 'User was successfully updated.')
  end
  
end
