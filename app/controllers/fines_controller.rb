class FinesController < ApplicationController
  before_action :set_fine, only: [:edit, :update, :destroy]
  before_action :set_loans, only: [:new, :edit]

    def index
      @fines = Fine.all
    end

    def new
      @fine = Fine.new
    end

    def edit
    end

    def create
      @fine = Fine.new(fine_params)
      respond_to do |format|
        if @fine.save
          format.json {head :no_content}
          format.js
        else
          format.json { render json: @fine.errors.full_messages, status: :unprocessable_entity }
          format.js {render :new}
        end
      end
    end

    def update
      respond_to do |format|
        if @fine.update(fine_params)
          format.json { head :no_content }
          format.js
        else
          format.json { render json: @fine.errors.full_messages, status: :unprocessable_entity }
          format.js {render :edit}
        end
      end
    end
    
    def destroy
      @fine.destroy
      respond_to do |format|
        format.json { head :no_content }
        format.js
      end
    end

    private
      def fine_params
        params.require(:fine).permit(:valor, :fecha, :estado, :Loan_id)
      end

      def set_fine
        @fine = Fine.find(params[:id])
      end

      def set_loans
        @loans = Loan.all
      end

end