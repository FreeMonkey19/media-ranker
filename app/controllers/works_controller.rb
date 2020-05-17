class WorksController < ApplicationController

  def main
    @works = Work.order(:category)
	end
	
  def index
    @works = Work.all
    if params[:search]
    	@works = Work.search(params[:search]).order("created_at DESC")
    else 
      @works = Work.all.order("created_at DESC")
    end
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
