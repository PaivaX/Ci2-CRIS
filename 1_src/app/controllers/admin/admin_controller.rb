class Admin::AdminController < ApplicationController
    before_action :authenticate_user!
    before_action(only: [:index, :users]) { only_allow_user_types(['superadmin', 'admin']) }
    layout 'dashboard'

    def index
    end
end
