class BookmarksController < ApplicationController
  # before_action :which_list, only: %i[new create]      <--------- é necessário antes de criar identificar a lista
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  # def which_list
  #   @list = List.find(params[:list_id])
  # end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
