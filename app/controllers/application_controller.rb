class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def find_user
    @user = User.find_by(id: session[:user_id])
  end

  def find_author
    @author = Author.find_by(id: params[:id])
  end

end
