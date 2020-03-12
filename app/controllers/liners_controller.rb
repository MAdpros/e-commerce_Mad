class LinersController < ApplicationController
  include CurrentDelivery
  before_action :set_delivery, only: [:create]
  before_action :set_liner, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_manager!, only: [:edit, :update]

  # GET /liners
  # GET /liners.json
  def index
    @liners = Liner.all
  end

  # GET /liners/1
  # GET /liners/1.json
  def show
  end

  # GET /liners/new
  def new
    @liner = Liner.new
    @order = Order.all
  end

  # GET /liners/1/edit
  def edit
  end

  # POST /liners
  # POST /liners.json
  def create
    transit = Transit.find(params[:transit_id]) 
    order = Order.find(params[:order_id])
    # @liner = @delivery.liners.new(transit: transit)
    @liner = @delivery.restreint_transit(transit, order)
      
      
    respond_to do |format|
      if @liner.save
        format.html { redirect_to transits_path, notice: 'Liner was successfully created.' }
        format.json { render :show, status: :created, location: @liner }
      else
        format.html { render :new }
        format.json { render json: @liner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liners/1
  # PATCH/PUT /liners/1.json
  def update
    respond_to do |format|
      if @liner.update(liner_params)
        format.html { redirect_to @liner, notice: 'Liner was successfully updated.' }
        format.json { render :show, status: :ok, location: @liner }
      else
        format.html { render :edit }
        format.json { render json: @liner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liners/1
  # DELETE /liners/1.json
  def destroy
    @liner.destroy
    respond_to do |format|
      format.html { redirect_to liners_url, notice: 'Liner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liner
      @liner = Liner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liner_params
      params.require(:liner).permit(:delivery_id, :transit_id, :order_id)
    end
end
