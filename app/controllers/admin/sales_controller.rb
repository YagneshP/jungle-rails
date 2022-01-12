class Admin::SalesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']
  def index
    @sales = Sale.all
  end
end
