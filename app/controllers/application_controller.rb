class ApplicationController < ActionController::Base
  include SessionsHelper

  private

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please sync your bank first."
        redirect_to root_url
      end
    end
end
