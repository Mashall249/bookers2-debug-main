class SearchesController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == "user"
      @records = User.search_for(@content, @method)
    else
      @records = Books.search_for(@content, @method)
    end
  end
end
