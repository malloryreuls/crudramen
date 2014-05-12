class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :show, :destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else render "new"
    end
  end

  def edit
  end

  def update
    if @customer = Customer.update(customer_params)
      redirect_to customers_path
    else render "edit"
    end
  end

  def show
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :phone)
  end
end 
