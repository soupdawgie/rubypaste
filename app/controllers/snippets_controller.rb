class SnippetsController < ApplicationController
  before_action :correct_user,       only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @snippets = current_user.snippets.paginate(page: params[:page], per_page: 10)
    else
      render 'static_pages/welcome'
    end
  end

  def show
    @snippet = Snippet.find_by(token: params[:token])
    if @snippet.public? || @snippet.user == current_user
      render 'show'
    else
      redirect_to root_url
      flash[:alert] = "The snippet is private."
    end
  end

  def new
    @snippet = Snippet.new(title: Time.now.strftime("%d %B %Y, %H:%M"))
  end

  def create
    @snippet = current_user.snippets.build(snippet_params)
    if @snippet.save
      flash[:success] = "Snippet is saved!"
      redirect_to @snippet
    else
      render 'new'
    end
  end

  def edit
    @snippet = current_user.snippets.find_by(token: params[:token])
  end

  def update
    @snippet = current_user.snippets.find_by(token: params[:token])
    if @snippet.update_attributes(snippet_params)
      flash[:success] = "Snippet successfully updated!"
      redirect_to @snippet
    else
      render 'edit'
    end
  end

  def destroy
    current_user.snippets.find_by(token: params[:token]).destroy
    flash[:success] = "Snippet deleted."
    redirect_to root_path
  end
end

  private

  def snippet_params
    params.require(:snippet).permit(:code, :title, :token, :public)
  end

  def correct_user
    @snippet = current_user.snippets.find_by(token: params[:token])
    redirect_to root_url if @snippet.nil?
  end
