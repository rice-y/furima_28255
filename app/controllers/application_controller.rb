class ApplicationController < ActionController::Base

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["AUTH_USER"] && password == ENV["AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end

  end
end
