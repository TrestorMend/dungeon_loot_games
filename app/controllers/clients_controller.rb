class ClientsController < InheritedResources::Base
  def index
    @clients = Client.all
    @categories = Category.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @categories = Category.all
  end

  # GET /clients/new
  def new
    @client = Client.new
    @provinces = Province.all
    @categories = Category.all
  end

  # GET /clients/1/edit
  def edit
    @provinces = Province.all
    @categories = Category.all
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    @categories = Category.all
    respond_to do |format|
      if @client.save
        format.html { redirect_to cart_path, notice: 'Client was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
    @categories = Category.all
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
    @categories = Category.all
  end
  
  private
    def set_client
      @client = Client.find(params[:id])
    end
    
    def client_params
      params.require(:client).permit(:first_name, :last_name, :address, :email, :phone, :province_id)
    end
end

