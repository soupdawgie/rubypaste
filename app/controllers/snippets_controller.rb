class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.paginate(page: params[:page], per_page: 10)
  end

  def show
    @snippet = Snippet.find_by(token: params[:token])
  end

  def new
    @snippet = Snippet.new(title: Time.now.strftime("%d %B %Y, %H:%M"))
  end

  def create
    @snippet = Snippet.new(snippet_params)
    if @snippet.save
      flash[:success] = "Snippet is saved!"
      redirect_to @snippet
    else
      render 'new'
    end
  end

  def edit
    @snippet = Snippet.find_by(token: params[:token])
  end

  def update
    @snippet = Snippet.find_by(token: params[:token])
    if @snippet.update_attributes(snippet_params)
      flash[:success] = "Snippet successfully updated!"
      redirect_to @snippet
    else
      render 'edit'
    end
  end

  def destroy
    Snippet.find_by(token: params[:token]).destroy
    flash[:success] = "Snippet deleted."
    redirect_to root_path
  end

end

  private

    def snippet_params
      params.require(:snippet).permit(:code, :title, :token)
    end
