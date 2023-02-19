class ResearchersController < ApplicationController
    def new
        @researchers = Researcher.new
    end
             
    def create
        @researchers = Researcher.new(researcher_params)
        @researchers.avatar.attach(params[:avatar])
        associateInstitutionsToResearcher(params[:institution_ids])
            if @researchers.save
              redirect_to @researchers
            else
              render :new
            end
    end
        
    def index
        @researchers = Researcher.all
    end
        
    def show
        @researchers = Researcher.find(params[:id])
    end

    def edit
        @researchers = Researcher.find(params[:id])
    end
        
    def update
            @researchers = Researcher.find(params[:id])

            if(params[:institution_ids].length != 0)
              @researchers.institutions.clear
              associateInstitutionsToResearcher(params[:institution_ids])
            end

            if @researchers.update(researcher_params)
              redirect_to @researchers
            else
              render :edit
            end
    end

    def destroy
      @researchers = Researcher.find(params[:id])
      @researchers.destroy

      redirect_to researchers_path
    end

    private
        def researcher_params
            params.require(:researcher).permit(:name, :resume, :email, :website, :birthday, :degree, :avatar)
    end

    def associateInstitutionsToResearcher(ids)
      ids.each do |id|
        unless id.to_s.strip.empty?
          @researchers.institutions << Institution.find(id)
        end
      end
    end
end