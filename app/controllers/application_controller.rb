class ApplicationController < ActionController::Base
  include SessionsHelper
  
  def about
  end 
  
  def contact
  end
  
  private
  
    def logged_in_user
        unless logged_in?
          store_location
          flash[:danger]="ログインしてください"
          redirect_to login_url
        end
    end
    
    def display_image
      image.variant(resize_to_limit: [500, 500])
    end
  
end
