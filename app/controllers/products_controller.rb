class ProductsController < ApplicationController
  before_action :authenticate
  before_action :initialize_client

  def index
    @products = @client.query("select Name, Code, Description from Product")
  end

  private

  def authenticate
    redirect_to 'http://localhost:3000/home/index' if session['token'].blank?
  end

  def initialize_client
    @client = Restforce.new(
      oauth_token: session['token'],
      refresh_token: session['refresh_token'],
      instance_url: session['instance_url'],
      client_id: $salesforce_config['client_key'],
      client_secret: $salesforce_config['client_secret']
    )
  end
end
