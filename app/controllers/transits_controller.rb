class TransitsController < ApplicationController
  include CurrentCart
  include CurrentDelivery
  before_action :set_transit, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_manager!, only: [:create, :edit, :update, :destroy]

  # GET /transits
  # GET /transits.json
  def index
    if current_user.delivery == nil
        @transits = Transit.all
         @cart = Cart.find(current_user.cart.id)
    @liner = Liner.all
    else
    @delivery = Delivery.find(current_user.delivery.id)
     @transits = Transit.all
         @cart = Cart.find(current_user.cart.id)
    @liner = Liner.all
    end
  end

  # GET /transits/1
  # GET /transits/1.json
  def show
  end

  # GET /transits/new
  def new
    @transit = Transit.new
  end

  # GET /transits/1/edit
  def edit
  end

  # POST /transits
  # POST /transits.json
  def create
    @transit = Transit.new(transit_params)

    respond_to do |format|
      if @transit.save
        format.html { redirect_to @transit, notice: 'Transit was successfully created.' }
        format.json { render :show, status: :created, location: @transit }
      else
        format.html { render :new }
        format.json { render json: @transit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transits/1
  # PATCH/PUT /transits/1.json
  def update
    respond_to do |format|
      if @transit.update(transit_params)
        format.html { redirect_to @transit, notice: 'Transit was successfully updated.' }
        format.json { render :show, status: :ok, location: @transit }
      else
        format.html { render :edit }
        format.json { render json: @transit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transits/1
  # DELETE /transits/1.json
  def destroy
    @transit.destroy
    respond_to do |format|
      format.html { redirect_to transits_url, notice: 'Transit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transit
      @transit = Transit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transit_params
      params.require(:transit).permit(:name, :mode, :price)
    end
end
