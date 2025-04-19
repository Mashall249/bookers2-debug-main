class FavoritesController < ApplicationController

  def create
    @books = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: @books.id)
    @favorite.save
  end
  
  def destroy
    @books = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @books.id)
    @favorite.destroy
  end

 end