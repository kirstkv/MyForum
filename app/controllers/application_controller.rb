class ApplicationController < ActionController::Base
  before_filter :set_timezone
  
  def set_timezone
    if current_user!=nil
      Time.zone=current_user.time_zone
    else
      Time.zone='London'
    end
    
  end
end
