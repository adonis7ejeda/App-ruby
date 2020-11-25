class DetailsController < ApplicationController
  before_action :set_detail, only: [:edit, :update, :destroy]
  before_action :set_loans, only: [:new, :edit]
  before_action :set_books, only: [:new, :edit]


  def index
    @details = Detail.all
  end
    
  def new
    @detail = Detail.new
  end
    
  def edit
  end

  def create
    @detail = Detail.new(detail_params)
    respond_to do |format|
      if @detail.save
        format.json {head :no_content}
        format.js
      else
        format.json { render json: @detail.errors.full_messages, status: :unprocessable_entity }
        format.js {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @detail.update(detail_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @detail.errors.full_messages, status: :unprocessable_entity }
        format.js {render :edit}
      end
    end
  end

  def destroy
    @detail.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private
    def detail_params
      params.require(:detail).permit(:cantidad, :loan_id, :book_id)
    end

    def set_detail
      @detail = Detail.find(params[:id])
    end

    def set_loans
      @loans = Loan.all
    end

    def set_books
      @books = Book.all
    end

end