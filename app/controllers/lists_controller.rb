class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.all
    @list_bookmarks = @bookmarks.select{ |bookmark| bookmark[:list_id] == params[:id].to_i }
    @movies = []
    @list_bookmarks.each do |bookmark|
      @movies << Movie.find(bookmark[:movie_id])
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to new_bookmark_path
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
