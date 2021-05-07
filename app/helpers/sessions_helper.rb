module SessionsHelper
  def log_in(link_id, institution)
      session[:link_id] = link_id
      session[:institution] = institution
  end

  def logged_in?
      !session[:link_id].nil?
  end

  def current_session
    { "link" => session[:link_id], "institution" => session[:institution] }
  end

  def log_out
      session.delete(:link_id)
      session.delete(:institution)
  end
end
