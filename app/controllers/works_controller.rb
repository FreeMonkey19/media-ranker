class WorksController < ApplicationController

  before_action :find_work, only: [:show, :edit, :update, :destroy]

  def main
    @works = Work.order(:category)
    @winner = @works.winner
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
    if @work.nil?
      redirect_to works_path
      return
    end
  end

  def new # renders form for create action
    @work = Work.new
  end

  def create
    @work = Work.new(
      work_params
    )
    if @work.save
      redirect_to works_path
      flash[:success] = "#{@work.title} was successfully created!"
      return
    else
      flash.now[:error] = "Error: #{@work.title} was NOT created!"
      render :new
      return
    end
	end

  def edit
    if @work.nil?
      redirect_to works_path
      return
    end
  end

  def update
		if @work.nil?
			head :not_found
			return
		elsif @work.update(work_params)
			redirect_to work_path(@work.id)
			return 
		else
			render :edit 
			return 
		end
	end

  def destroy
    if @work.destroy
      flash[:success] = "Successfully deleted #{@work.title}"
      redirect_to works_path
    end
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find_by(id: params[:id])
  end

end
