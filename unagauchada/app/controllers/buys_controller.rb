class BuysController < ApplicationController
  before_action :set_buy, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /buys
  # GET /buys.json
  def index
    @buys = Buy.all
  end

  # GET /buys/1
  # GET /buys/1.json
  def show
  end

  # GET /buys/new
  def new
    @buy = Buy.new
  end

  # GET /buys/1/edit
  def edit
  end

  # POST /buys
  # POST /buys.json
  def create
    @buy = Buy.new(buy_params)
    @tarjetas= Card.all
    @numero= @buy.numero_de_tarjeta 
    #@tarjeta=@tarjetas.first
    @tarjeta = @tarjetas.find_by(numero: @numero)
    @precio_total= @buy.cantidad * 50
    unless @tarjeta.nil?
      if @tarjeta.credito >= @precio_total
            @buy.precio_actual=50
            @buy.precio_total=@precio_total
            @tarjeta.credito= @tarjeta.credito - @precio_total 
            
            @buy.user_id=current_user.id
            current_user.creditos=current_user.creditos + @buy.cantidad
            
            respond_to do |format|
              if @buy.save and current_user.save and @tarjeta.save
                format.html { redirect_to @buy, notice: 'Se ha realizado la compra con éxito.' }
                format.json { render :show, status: :created, location: @buy }
              else
                format.html { render :new }
                format.json { render json: @buy.errors, status: :unprocessable_entity }
              end
            end
        else
          respond_to do |format|
          format.html { redirect_to '/buys/new', notice: 'Crédito insuficiente.' }
        end
        end
      else
        respond_to do |format|
        format.html { redirect_to '/buys/new', notice: 'Tarjeta invalida.' }
       end
  end
end
  # PATCH/PUT /buys/1
  # PATCH/PUT /buys/1.json
  def update
    respond_to do |format|
      if @buy.update(buy_params)
        format.html { redirect_to @buy, notice: 'Buy was successfully updated.' }
        format.json { render :show, status: :ok, location: @buy }
      else
        format.html { render :edit }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buys/1
  # DELETE /buys/1.json
  def destroy
    @buy.destroy
    respond_to do |format|
      format.html { redirect_to buys_url, notice: 'Buy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy
      @buy = Buy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buy_params
      params.require(:buy).permit(:cantidad, :precio_total, :precio_actual, :fecha, :numero_de_tarjeta)
    end
end
