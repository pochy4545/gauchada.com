class PostularseController < ApplicationController
before_action :authenticate_user!
# GET /postulantes
  # GET /postulantes.json
  def index
    @postulantes = Postularse.all
  end

  # GET /postulantes/1
  # GET /postulantes/1.json
  def show
  end

  # GET /postulantes/new
  def new
    @postularse = Postularse.new
    @id_gauchada=params[:id_gauchada]
  end

  # GET /postulantes/1/edit
  def edit
  end

  # POST /postulantes
  # POST /postulantes.json
  def create
    
	@postularse = Postularse.new(postularse_params)
	@postularse.user_id= current_user.id
    @gauchada=Gauchada.find(@postularse.gauchada_id)
    @gauchada.cant_postulantes= @gauchada.cant_postulantes + 1
    @gauchada.save
    @postularse.save
	respond_to do |format|
	  if @postularse.save
	    format.html { redirect_to @gauchada, notice: 'Ud se ha postulado correctamente.' }
	  else
	    format.html { render :new }
	    format.json { render json: @postularse.errors, status: :unprocessable_entity }
	  end
	end   
  end

  # PATCH/PUT /postulantes/1
  # PATCH/PUT /postulantes/1.json
  def update
    respond_to do |format|
      if @postularse.update(postularse_params)
        format.html { redirect_to @postularse, notice: 'Postularse was successfully updated.' }
        format.json { render :show, status: :ok, location: @postularse }
      else
        format.html { render :edit }
        format.json { render json: @postularse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulantes/1
  # DELETE /postulantes/1.json
  def destroy
    @postularse.destroy
    respond_to do |format|
      format.html { redirect_to postulantes_url, notice: 'Postularse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postularse
      @postularse = Postularse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postularse_params
      params.require(:postularse).permit(:descripcion,:gauchada_id)
    end


end
