class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @new_list = List.new
  end

  def create
    @new_list = List.new(list_params)
    if @new_list.save
      redirect_to list_path(@new_list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
