require 'belvo'
require 'json'

class SessionsController < ApplicationController
  include ApplicationHelper, SessionsHelper

  def new
    if logged_in?
        redirect_to root_url
    end
        
  end

  def get_token
    response = belvo_client.widget_token.create
    render json: response.to_json
  end

  def create
    log_in(params[:link_id], params[:institution])
    redirect_to root_url
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
