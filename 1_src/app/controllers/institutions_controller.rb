class InstitutionsController < ApplicationController
  def index
    @institutions = Institution.all
  end

  def show
    @institutions = Institution.find(params[:id])
  end

  def new
    @institutions = Institution.new
  end

  def create
    @institutions = Institution.new(institution_params)
    # institutions.image.attach(params[:Institution_params])
    if @institutions.save
      flash[:notice] = "Your account information was succesfully updated!"
      redirect_to @institutions
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @institutions = Institution.find(params[:id])
  end

  def update
    @institutions = Institution.find(params[:id])

    if @institutions.update(institution_params)

      flash[:notice] = "Your account information was succesfully updated!"
      redirect_to @institutions
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @institutions = Institution.find(params[:id])
    @institutions.destroy

    redirect_to "/institutions", status: :see_other
  end

  private
    def institution_params
      params.require(:institution).permit(:name, :description, :url, :image, :partner)
    end
end
