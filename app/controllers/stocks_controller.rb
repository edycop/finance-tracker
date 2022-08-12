class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        @tracked_stocks = current_user.stocks
        render 'users/my_portfolio', locals: { stock: @stock, tracked_stocks: @tracked_stocks }
      else
        flash.now[:alert] = 'Please enter a valid symbol to search'
        @tracked_stocks = current_user.stocks
        render 'users/my_portfolio', locals: { stock: @stock, tracked_stocks: @tracked_stocks }
      end
    else
      flash.now[:alert] = 'Please enter a symbol to search'
      @tracked_stocks = current_user.stocks
      render 'users/my_portfolio', locals: { stock: @stock, tracked_stocks: @tracked_stocks }
    end
  end
end
