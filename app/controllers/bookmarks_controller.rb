class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    # @movies = Movie.all
    # @lists = List.all
  end

  def create
    @bookmark = Bookmark.new(
      comment: bookmark_params[:comment],
      list: List.find(bookmark_params[:list_id]),
      movie: Movie.find(bookmark_params[:movie_id])
    )
    if @bookmark.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
