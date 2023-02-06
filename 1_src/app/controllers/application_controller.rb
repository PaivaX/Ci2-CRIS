# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base

  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
    def only_allow_user_types(user_types)
        head(403) unless user_types.include?(current_user.user_type)
    end
end



