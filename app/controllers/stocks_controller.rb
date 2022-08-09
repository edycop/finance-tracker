class StocksController < ApplicationController
  def index
  end

  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        # render json: @stock
        # render my_portfolio_path # Render the view not call the endpoint
        # render 'users/my_portfolio'
        # render partial: 'stock', locals: { stock: @stock }
        # render @stock
      else
        flash.now[:alert] = 'Please enter a valid symbol to search'
        # redirect_to my_portfolio_path
        # render 'users/my_portfolio'
      end
    else
      flash.now[:alert] = 'Please enter a symbol to search'
      # redirect_to my_portfolio_path
      # render 'users/my_portfolio'
    end
    render 'users/my_portfolio'
  end
end
