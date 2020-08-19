class ApplicationController < ActionController::Base
　before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_katakana, :first_katakana, :birthday])
  end
  
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["AUTH_USER"] && password == ENV["AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end

  end
end
