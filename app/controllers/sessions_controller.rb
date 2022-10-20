class SessionsController < ActionController
  def index
    session[:page_views] ||= 0
    session[:page_views] += 1
    render json: { session: session }
    if (session[:page_views].to_i <= 3)
      render json: { session: session }
    else
      render status: 401
    end
  end
end
