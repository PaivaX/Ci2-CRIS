class ArticlesController < ApplicationController
  #before_action :authenticate_user!, :except => [:index, :show, :listSelect]
  def index
    @articles = Article.all
  end

  def listSelect
    @articles = Article.where(type: params[:type])
  end

  def create
    @article = Article.new(getParamsCreate(params[:article][:type]))


    if params[:project_ids]
      associateProjectsToArticle(params[:project_ids])
    end
    if params[:researcher_ids]
      associateResearchersToArticle(params[:researcher_ids])
    end

    if @article.save

      redirect_to articles_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update

    @article = Article.find(params[:id])

    project_ids = params[:project_ids]
    if project_ids
      if(project_ids.length != 0)
        @article.projects.clear
        associateProjectsToArticle(project_ids)
      end
    end

    researcher_ids = params[:researcher_ids]
    if researcher_ids
      if(researcher_ids.length != 0)
        @article.projects.clear
        associateProjectsToArticle(researcher_ids)
      end
    end


    if @article.update(getParamsEdit(@article.type))
      redirect_to article_url
    else
      render :edit, status:  :unprocessable_entity
    end
  end

  def tagged
    if params[:tag].present?
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all
    end
    render 'index'
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def associateProjectsToArticle(ids)
    ids.each do |id|
      unless id.to_s.strip.empty?
        @article.projects << Project.find(id)
      end
    end
  end

  def associateResearchersToArticle(ids)
    ids.each do |id|
      unless id.to_s.strip.empty?
        @article.researchers << Researcher.find(id)
      end
    end
  end

  def getParamsCreate(type)
    case type
    when 'Book'
      return book_params
    when 'Conference'
      return conference_params
    when 'Thesis'
      return thesis_params
    when 'Report'
      return report_params
    when 'Journal'
      return journal_params
    when ''
      raise "Empty type"
    when nil
      raise "Null type"
    else raise "Invalid Object type"
    end
  end

  def getParamsEdit(type)
    case type
    when 'Book'
      return book_edit_params
    when 'Conference'
      return thesis_edit_params
    when 'Thesis'
      return thesis_edit_params
    when 'Report'
      return report_edit_params
    when 'Journal'
      return journal_edit_params
    when ''
      raise "Empty type"
    when nil
      raise "Null type"
    else raise "Invalid Object type"
    end
  end

  def book_edit_params
    params.require(:book).permit(:title, :abstract, :authors, :publish_date, :pages, :keyword_list, :url, :ids, :project_id, :edition, :publisher, :type)
  end
  def thesis_edit_params
    params.require(:thesis).permit(:title, :abstract, :authors, :publish_date, :pages, :keyword_list, :url, :ids, :project_id, :edition, :publisher, :type)
  end
  def journal_edit_params
    params.require(:journal).permit(:title, :abstract, :authors, :publish_date, :pages, :keyword_list, :url, :ids, :project_id, :edition, :publisher, :type)
  end
  def conference_edit_params
    params.require(:conference).permit(:title, :abstract, :authors, :publish_date, :pages, :keyword_list, :url, :ids, :project_id, :edition, :publisher, :type)
  end
  def report_edit_params
    params.require(:report).permit(:title, :abstract, :authors, :publish_date, :pages, :keyword_list, :url, :ids, :type)
  end

  def report_params
    params.require(:article).permit(:title, :abstract, :authors, :publish_date, :pages, :keyword_list, :url, :ids, :type)
  end

  def conference_params
    params.require(:article).permit(:title, :abstract, :authors, :publish_date, :pages, :keyword_list, :url, :ids, :proceedings, :place, :type)
  end

  def book_params
    params.require(:article).permit(:title, :abstract, :authors, :publish_date, :pages, :keyword_list, :url, :ids, :edition, :publisher, :type)
  end

  def journal_params
    params.require(:article).permit(:title, :abstract, :authors, :publish_date, :pages, :keyword_list, :url, :ids, :journal_name, :type)
  end

  def thesis_params
    params.require(:article).permit(:title, :abstract, :authors, :publish_date, :pages, :keyword_list, :url, :ids,  :university, :thesis_type, :type)
  end

end