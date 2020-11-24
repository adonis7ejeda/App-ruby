class LoansController < ApplicationController
  before_action :set_loan, only: [:edit, :update, :destroy]
  before_action :set_users, only: [:new, :edit]

  def index
    @loans = Loan.all
  end

  def new
    @loan = Loan.new
  end

  def edit
  end

  def create
    @loan = Loan.new(loan_params)
    respond_to do |format|
      if @loan.save
        format.json {head :no_content}
        format.js
      else
        format.json { render json: @loan.errors.full_messages, status: :unprocessable_entity }
        format.js {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @loan.errors.full_messages, status: :unprocessable_entity }
        format.js {render :edit}
      end
    end
  end

  def destroy
    @loan.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private
    def loan_params
      params.require(:loan).permit(:fecha, :estado, :user_id)
    end

    def set_loan
      @loan = Loan.find(params[:id])
    end

    def set_users
      @users = User.all
    end

end