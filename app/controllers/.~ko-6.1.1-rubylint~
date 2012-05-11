class ApplicationController < ActionController::Base
  before_filter :set_timezone
  
  def set_timezone
    if current_user!=nil
      Time.zone=current_user.time_zone
    else
      Time.zone='London'
    end
    
  end
  
  def routing
    redirect_to( root_url, :notice => "Page not found")
  end
  
  private
  
  def make_admin
    users=User.all
    if users.count==1
      users.each do |u|
        u.admin="true"
        u.save
      end
    end
  end
  
  def check_admin
    if current_user!=nil
      if current_user.admin!=true
        redirect_to( root_url, :notice => "Not authorized user")
      end
    end
  end
  

end
