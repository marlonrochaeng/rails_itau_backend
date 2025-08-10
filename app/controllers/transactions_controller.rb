class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def get_based_on_time
    _days = params[:days].to_i
    @transactions = Transaction.where(dataHora: _days.days.ago..Time.now)

    @soma = @transactions.sum(:valor)
    @min = @transactions.minimum(:valor) || 0
    @max = @transactions.maximum(:valor) || 0
    @avg = @transactions.average(:valor).to_f
    @len = @transactions.size

    render json: { soma: @soma, min: @min, avg: @avg, count: @len, max: @max }, status: :ok
  end

  def delete
    Transaction.delete_all
    render json: { message: "All records deleted" }, status: :ok
  end

  def create
    @time = Time.now
    @transaction = Transaction.new(transaction_params)

    if @time < @transaction.dataHora
      render json: { error: "dataHora cant be in the future" }, status: :unprocessable_content
    else
      if @transaction.valor < 0
        render json: { error: "valor cant be less than zero" }, status: :unprocessable_content
      else
        if @transaction.save
          render json: @transaction, status: :created
        else
          render json: @transaction.errors, status: :unprocessable_content
        end
      end
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(:valor, :dataHora)
  end
end
