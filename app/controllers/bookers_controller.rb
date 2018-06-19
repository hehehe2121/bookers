class BookersController < ApplicationController
  def top
  end

  def index
      @bookers = Booker.all
      @booker = Booker.new
  end

  def show
      @booker = Booker.find(params[:id])
  end

  def create
      @book = Booker.new(booker_params)
       if @book.save
          flash[:notice] = "Book was successfully created."
          redirect_to booker_path(@book.id)
       else
          @bookers = Booker.all
          @booker = @book
          # binding pry
          render action: :index
        end
  end

  def new
      #空のモデル渡す
      @booker = Booker.new
  end

  def edit
      @booker = Booker.find(params[:id])
  end

  def update
      @booker = Booker.find(params[:id])
      if @booker.update(booker_params)
         flash[:notice] = "Book was successfully updated."
         redirect_to booker_path(@booker.id)
      else
        render action: :edit
      end
  end

  def destroy
      booker = Booker.find(params[:id])
      booker.destroy
      redirect_to bookers_index_path
  end

  def booker_params
      params.require(:booker).permit(:title, :body)
  end
end
