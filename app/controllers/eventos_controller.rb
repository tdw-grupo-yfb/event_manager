
class EventosController < ApplicationController
  USER_ID, PASSWORD = "admin", "admin64"

  # Requiere autenticacion solo para admin, crear y editar
  before_filter :authenticate, :only => [:admin, :new, :edit ]

  # GET /eventos
  def index
    @tramites = Evento.find(:all, :order => "fechai asc", :limit =>10, :conditions => ["categoria=? AND fechai >= ?", "T", Date.today])
    @noticias = Evento.find(:all, :order => "fechai asc", :limit =>10, :conditions => ["categoria=? AND fechai >= ?", "N", Date.today])
    @vistos = Evento.find(:all, :order => "visitas desc, fechai", :limit =>10, :conditions => ["visitas > 0 AND fechai >= ?", Date.today])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /admin
  def admin
    @eventos = Evento.find(:all, :order => "fechai asc, tipo desc")

    respond_to do |format|
      format.html # index.html.erb
    end
  end  

  # GET /eventos/1
  def show
    @evento = Evento.find(params[:id])
    @evento.visitas = @evento.visitas.nil? ? 1 : @evento.visitas + 1
    @evento.save

    respond_to do |format|
      format.html { render html: @evento, :layout => 'empty'}
    end
  end

  # GET /eventos/new
  # GET /eventos/new.json
  def new
    @evento = Evento.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /eventos/1/edit
  def edit
    @evento = Evento.find(params[:id])
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(params[:evento])
    @evento.estado = "P"
    respond_to do |format|
      if @evento.save
        format.html { redirect_to admin_url, notice: 'El Evento fue creado exitosamente.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /eventos/1
  def update
    @evento = Evento.find(params[:id])
    
    respond_to do |format|
      if @evento.update_attributes(params[:evento])
        format.html { render :edit, notice: 'El Evento fue actualizado exitosamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /eventos/1
  def destroy
    @evento = Evento.find(params[:id])
    @evento.destroy

    respond_to do |format|
      format.html { redirect_to admin_url }
    end
  end

  private

  def authenticate
      authenticate_or_request_with_http_basic do |id, password| 
          id == USER_ID && password == PASSWORD
      end
  end
end
