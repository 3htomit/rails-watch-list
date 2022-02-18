class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    # @movies = Movie.all
  end

  def create
    if (bookmark_params[:comment] == "" || bookmark_params[:list_id] == "" || bookmark_params[:movie_id] == "")
      render :new
    else
      @bookmark = Bookmark.create(
        comment: bookmark_params[:comment],
        list: List.find(bookmark_params[:list_id]),
        movie: Movie.find(bookmark_params[:movie_id])
      )
      redirect_to root_path
    end
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
