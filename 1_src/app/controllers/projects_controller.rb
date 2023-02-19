class ProjectsController < ApplicationController
  #before_action :authenticate_user!, :except => [:index, :show]
    def index
      @projects = Project.paginate(:page => params[:page], :per_page => 6)
    end

    def filter
      @projects = Project.where(project_role: params[:project_role])
    end
    
    def show
      @projects = Project.find(params[:id])
    end
  
    def new
      @projects = Project.new
    end
  
    def create
      @projects = Project.new(projects_params)
  
      if @projects.save
        redirect_to @projects
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      @projects = Project.find(params[:id])
    end
  
    def update
      @projects = Project.find(params[:id])
  
      if @projects.update(projects_params)
        redirect_to @projects
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @projects = Project.find(params[:id])
      @projects.destroy
  
      redirect_to root_path, status: :see_other
    end

    private
      def projects_params
        params.require(:project).permit(:title, :description, :project_role, :avatar, :start_date, :end_date, :funding_type, :fund_start_date, :fund_end_date, :funding_entity, :funding_program, :name_program, :total_budget, :local_budget, :grant_number, :url_project, :relationship)
      end
  end  