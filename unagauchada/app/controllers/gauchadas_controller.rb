  class GauchadasController < ApplicationController
  before_action :set_gauchada, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]
  # GET /gauchadas
  # GET /gauchadas.json
  
  def index
    @busqueda=params[:searchbox]
    @selecion=params[:selecion]
    @order=params[:opcion]
    @opcion="#{@selecion} #{params[:opcion]}"
    
    
    if @busqueda and @selecion
      @gauchadas= Gauchada.search(@busqueda).order(@opcion)
      
    elsif @selecion
      @gauchadas= Gauchada.order(@opcion)
      
    elsif @busqueda
        @gauchadas= Gauchada.search(@busqueda)
    else
      @gauchadas= Gauchada.all
    end
  end


  # GET /gauchadas/1
  # GET /gauchadas/1.json
  def show
  end

  # GET /gauchadas/new
  def new
    @gauchada = Gauchada.new
    
  end

  # GET /gauchadas/1/edit
  def edit
    if @gauchada.cant_postulantes > 0
      respond_to do |format|
        format.html { redirect_to @gauchada, notice: 'No se puede editar porque hay postulantes pendientes.' }
      end
    end
  end

  # POST /gauchadas
  # POST /gauchadas.json
  def create
    if current_user.creditos >= 1
      @gauchada = current_user.gauchadas.new(gauchada_params)

      respond_to do |format|
        if @gauchada.save
          @credito=current_user.creditos - 1
          current_user.update_column(:creditos, @credito )
          format.html { redirect_to @gauchada, notice: 'Gauchada Creada con éxito.' }
          format.json { render :show, status: :created, location: @gauchada }
        else
          format.html { render :new }
          format.json { render json: @gauchada.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to '/buys/new', notice: 'Ud no posee credito para realizar la compra.' }
      end
    end
  end

  # PATCH/PUT /gauchadas/1
  # PATCH/PUT /gauchadas/1.json
  def update
    respond_to do |format|
      if @gauchada.update(gauchada_params)
        format.html { redirect_to @gauchada, notice: 'Gauchada acutalizada correctamente.' }
        format.json { render :show, status: :ok, location: @gauchada }
      else
        format.html { render :edit }
        format.json { render json: @gauchada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gauchadas/1
  # DELETE /gauchadas/1.json
  def destroy
    if @gauchada.cant_postulantes > 0
      respond_to do |format|
        format.html { redirect_to @gauchada, notice: 'No se puede eliminar porque hay postulantes.' }
      end
    else
      @user=@gauchada.user
      @user.creditos= @user.creditos + 1
      @user.save
      @gauchada.destroy
      respond_to do |format|
        format.html { redirect_to gauchadas_url, notice: 'Gauchada eliminada.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gauchada
      @gauchada = Gauchada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gauchada_params
      params.require(:gauchada).permit(:nombre, :title, :descripcion, :estado, :fecha_de_inicio, :fecha_limite, :cover, :ciudad,:buscar)
    end
end
