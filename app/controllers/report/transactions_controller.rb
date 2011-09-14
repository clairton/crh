class Report::TransactionsController < ApplicationController
  # GET /report/transactions
  # GET /report/transactions.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /report/transactions/1
  # GET /report/transactions/1.xml
  def show
    @report_transaction = Report::Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report_transaction }
    end
  end
end
