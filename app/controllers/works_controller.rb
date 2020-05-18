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
    result = @work.update(work_params)
    if result
      redirect_to work_path(@work.id)
    else
      render :edit
    end
  end

  def destroy
    # work = Work.find_by(id; params[;id]).destroy
    # redirect_to works_path
    # return
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
