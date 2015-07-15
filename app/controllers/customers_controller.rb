class CustomersController < ApplicationController
  before_action :authorize, only: [:edit, :update, :new, :create, :destroy]
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :telephone ]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.includes(:projects).all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end
  
  def telephone
      @custphone =  "("+@customer.phone.at(0..2)+")"  +
                    @customer.phone.at(3..5) +"-"+ 
                    @customer.phone.at(6..9)
   # @telephone = '(' + @customer.phone.first(3) +')' + @customer.phone.at(3..5) + '-' + @customer.phone.from(6) 
  end
  
  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :address, :phone, 
      project_attributes: [:location, :details, :price, :status])
    end
  end
