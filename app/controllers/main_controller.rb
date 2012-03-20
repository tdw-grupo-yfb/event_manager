class MainController < ActionController::Base
  protect_from_forgery
  
  def index
    render :action => 'login'
  end
  
  def login
    
  end
end
