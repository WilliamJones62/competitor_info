class CompetitorsController < ApplicationController
  before_action :set_competitor, only: [:show, :edit, :update, :destroy]
  before_action :build_dropdown_lists, only: [:new, :edit]

  # GET /competitors
  def index
    @competitors = Competitor.all
  end

  # GET /competitors/1
  def show
  end

  # GET /competitors/new
  def new
    @competitor = Competitor.new
  end

  # GET /competitors/1/edit
  def edit
  end

  # POST /competitors
  def create
    @competitor = Competitor.new(@cp)

    respond_to do |format|
      if @competitor.save
        format.html { redirect_to @competitor, notice: 'Competitor was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /competitors/1
  def update
    respond_to do |format|
      if @competitor.update(@cp)
        format.html { redirect_to @competitor, notice: 'Competitor was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /competitors/1
  def destroy
    @competitor.destroy
    respond_to do |format|
      format.html { redirect_to competitors_url, notice: 'Competitor was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competitor
      @competitor = Competitor.find(params[:id])
    end

    # Build dropdown lists for input form
    def build_dropdown_lists
      @type = ['Broard line', 'Food', 'Meat', 'Custom cut']
      @uom = ['LB', 'Each', 'Case']
      @source = ['Vendor', 'Invoice', 'Verbal']
      @delivery = ['Driver', 'Overnight']
      @grade = ['Prime', 'Choice plus', 'Choice', 'Select', 'Grade A', 'Grade B']
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competitor_params
      params.require(:competitor).permit(:rep, :competitor, :comp_type, :dart_mkt, :zip, :direct, :effective, :category, :sub_category, :description, :brand, :sub_brand, :uom, :weight, :price, :price_lb, :fresh, :sku, :dart_desc, :dart_price, :avg_price, :dart_uom, :list_price_var, :avg_price_var, :customer, :lb_in_reg, :lb_in_sub_reg, :lb_in_csa, :source, :delivery, :dart_delivery, :abf, :waterchilled, :send_all, :grade, :specs, :heritage, :breed, :grass_fed, :organic)
    end
end
