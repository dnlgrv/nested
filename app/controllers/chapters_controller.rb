class ChaptersController < ApplicationController
  before_action :set_book

  def create
    @chapter = @book.chapters.build(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to book_path(@book) }
        format.turbo_stream
      else
        format.html { render :new }
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(:new_chapter, partial: "form", locals: { chapter: @chapter })
        end
      end
    end
  end

  private
    def set_book
      @book = Book.find(params[:book_id])
    end

    def chapter_params
      params.require(:chapter).permit(:title)
    end
end
