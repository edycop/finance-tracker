# frozen_string_literal: true

class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.dig(:iex_client, :publishable_token),
      secret_token: Rails.application.credentials.dig(:iex_client, :secret_token),
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    # client.price(ticker_symbol)
    begin
      new(
        ticker: ticker_symbol,
        name: client.company(ticker_symbol).company_name,
        last_price: client.price(ticker_symbol)
      )
    rescue StandardError
      nil
    end
  end

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end
