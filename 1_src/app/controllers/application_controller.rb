class ApplicationController < ActionController::Base
    def only_allow_user_types(user_types)
        head(403) unless user_types.include?(current_user.user_type)
    end
end
