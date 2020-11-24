class LoansController < ApplicationController
  before_action :set_loan, only: [:edit]

  def index
    @loans = Loan.all
  end

  def new
    @loan = Loan.create(fecha: Time.now.strftime("%m/%d/%Y"), estado: 0)
    redirect_to edit_loan_path(@loan)
  end

  def edit
    @books_loan = @loan.details
  end

  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: "El prestamo ha sido eliminado" }
      format.json {head :no_content}
    end
  end

  private
    def set_loan
      @loan = Loan.find(params[:id])
    end
end