class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    id = params[:id]
    @work = Work.find_by(id: id)

    if @work.nil?
      redirect_to works_path
      return
    end
  end

  def edit
  end

  def create
  end


  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

end
