class ProjectsController < ApplicationController
  before_action :authorize, only: [:edit, :update, :new,:create, :destroy]  
  before_action :set_project, only: [ :show, :edit, :update, :destroy]
  before_action :find_customer, except: [ :show, :edit, :update, :destroy]
  
  # GET /projects
  # GET /projects.json
  def index    
    @projects = @customer.projects.includes(:materials).all
    
  end
  


  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = @customer.projects.create(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to customer_path(@customer), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to ([@customer, @project]), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to customer_path(@customer), notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



    # Use callbacks to share common setup or constraints between actions.

    
    def find_customer
      @customer = Customer.find(params[:customer_id])
    end
    
  private
  def set_project
    @project = Project.find(params[:id])
    @customer = @project.customer
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:location, :details, :price, :status, :customer_id)
    end
    

    

end
