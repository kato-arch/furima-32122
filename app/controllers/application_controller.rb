class ApplicationController < ActionController::Base
  # コントローラー説明：
  # application_controller.rb＝すべてのコントローラーが継承しているファイル

  # Basic認証によるログインの要求は、すべてのコントローラーで行う→privateに追記できる
 before_action :basic_auth
  # devise使う→privateで「configure_permitted_parameters」が使える
 before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end

  def configure_permitted_parameters
    # deviseのUserモデルにパラメーターを許可→permit(:sign_up, keys: [:name, :first_name, :last_name ~ password])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day, :email, :password])  
  end
end
