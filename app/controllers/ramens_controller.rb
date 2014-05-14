class RamensController < ApplicationController

before_action :set_ramen, only: [:edit, :update, :show, :destroy]
before_action :authenticate_customer

  def index
    @ramens = Ramen.all
  end

  def new
    @customer = Customer.find(params[:customer_id])
    if @customer == current_customer
      @ramen = Ramen.new
    else
      flash[:danger] = "You can only add ramen to your own account!"
      redirect_to customers_path(params[:customer_id])
    end
  end

  def create
    c = Customer.find(params[:customer_id])
    @ramen = c.ramens.new(ramen_params)
    if @ramen.save
      redirect_to customer_path(params[:customer_id])
    else render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    if @customer != current_customer
      flash[:danger] = "Edit your own ramens!"
      redirect_to customers_path(params[:customer_id])
    end
  end

  def show
  end

  def update
    if @ramen.update(ramen_params)
      redirect_to customer_path(params[:customer_id])
    else 
      render 'edit'
    end
  end

  def destroy
    if @customer == current_customer
    @ramen.destroy
    redirect_to customer_path(params[:customer_id])
    else
      flash[:danger] = "Delete your own ramens!"
      redirect_to customers_path(params[:customer_id])
    end
  end

private

  def set_ramen
    @ramen = Ramen.find(params[:id])
  end

  def ramen_params
    params.require(:ramen).permit(:noodles, :broth, :spicy, :egg, :bean_sprouts, :mushrooms, :broccoli, :corn, :spicy_miso, :extra_pork)
  end

end

