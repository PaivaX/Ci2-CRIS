class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action(only: [:index, :users]) { only_allow_user_types(['superadmin', 'admin']) }
    layout 'dashboard'
    
    def index
        @resource = User.all
    end
    
    def show
        @resource = User.find(params[:id])
    end

    def new
        @resource = User.new
    end

    def create
        @resource = User.new(params.require(:user).permit(:user_type, :name, :email, :password))

        if @resource.save
            redirect_to [:admin, @resource]
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @resource = User.find(params[:id])
    end

    def update
        @resource = User.find(params[:id])

        if @resource.update(params.require(:user).permit(:user_type, :name, :email))
            redirect_to [:admin, @resource]
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @resource = User.find(params[:id])
        @resource.destroy

        redirect_to action: 'index', status: :see_other
    end

    private

    def users_params
        params.require(:user).permit(:user_type, :name, :email, :password)
    end
end
