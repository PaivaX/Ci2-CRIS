class Admin::UsersController < ApplicationController
    before_action :authenticate_user!
    before_action { only_allow_user_types(['superadmin', 'admin']) }
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

        # only superadmins can create superadmins
        if @resource.user_type == 'superadmin' && current_user.user_type != 'superadmin'
            @resource.errors.add(:user_type, ": You don't have the permission to create Superadmins!")
            render :new, status: :unprocessable_entity
            return
        end
        
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

        # only superadmins can update superadmins
        if @resource.user_type == 'superadmin' && current_user.user_type != 'superadmin'
            @resource.errors.add(:user_type, ": You don't have the permission to update Superadmins!")
            render :new, status: :unprocessable_entity
            return
        end

        if @resource.update(params.require(:user).permit(:user_type, :name, :email))
            redirect_to [:admin, @resource]
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @resource = User.find(params[:id])

        # only superadmins can destory superadmins
        if @resource.user_type == 'superadmin' && current_user.user_type != 'superadmin'
            @resource.errors.add(:user_type, ": You don't have the permission to delete Superadmins!")
            flash[:alert] = "You don't have the permission to delete Superadmins!"
            redirect_to action: 'index', status: :unprocessable_entity
            return
        end

        @resource.destroy

        redirect_to action: 'index', status: :see_other
    end

    def block_unblock
        @resource = User.find(params[:id])

        # only superadmins can block superadmins
        if @resource.user_type == 'superadmin' && current_user.user_type != 'superadmin'
            @resource.errors.add(:user_type, ": You don't have the permission to block/unblock Superadmins!")
            flash[:alert] = ": You don't have the permission to block/unblock Superadmins!"
            redirect_to action: 'index', status: :unprocessable_entity
            return
        end

        @resource.blocked_at = @resource.blocked_at.nil? ? DateTime.now() : nil

        if @resource.save()
            flash[:notice] = 'User ' + (@resource.blocked_at.nil? ? 'unblocked' : 'blocked') + ' successfully.'
            redirect_to action: 'index'
        else
            flash[:error] = 'Failed to block/unblock user';
            redirect_to action: 'index', status: :unprocessable_entity
        end
    end
end
