class WorksController < ApplicationController

  before_action :find_work, only: [:show, :edit, :update, :destroy]

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
    work_id = params[:id]
    @work = Work.find_by(id: work_id)

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
      return
    else
      render :new
      return
    end
	end

  def edit
    work_id = params[:id]
    @work = Work.find_by(id: work_id)

    if @work.nil?
      redirect_to works_path
      return
    end
  end

  def update
		work_id = params[:id]
		@work = Work.find_by(id: work_id)
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
    work = Work.find_by(id: params[:id]).destroy
    redirect_to works_path
    return
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work
    @work = Work.find_by(id: params[:id])
  end
end
