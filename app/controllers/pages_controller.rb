class PagesController < ApplicationController
  before_action :set_note, except: [:destroy, :edit]

  def index
    @page = Page.new
    @pages = @note.pages.includes(:user).order("created_at DESC")
  end

  def new
    @page = Page.new
  end

  def search
    @pages = Page.search(params[:keyword])
  end

  def destroy
    page = Page.find(params[:id])
    @note = page["note_id"]
    page.destroy
    redirect_to note_pages_path(@note)
  end
  
  def edit
    @note = Note.find(params[:note_id])
    @page = Page.find(params[:id])
  end

  def update
    page = Page.find(params[:id])
    page.update(pages_params)
    redirect_to note_pages_path(@note)
  end

  def create
    @page = @note.pages.new(pages_params)
    if @page.save
      redirect_to note_pages_path(@note)
    else
      @pages = @note.pages.includes(:user)
      render :index
    end
  end

  private

  def pages_params
    params.require(:page).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def set_note
    @note = Note.find(params[:note_id])
  end

end
