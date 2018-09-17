class CompetitorsController < ApplicationController
  before_action :set_competitor, only: [:show, :edit, :update, :destroy]
  before_action :build_dropdown_lists, only: [:new, :edit]
  before_action :load_rep, only: [:create, :update]
  before_action :build_comp_list, only: [:list]

  # GET /competitors
  def index
    competitors = Competitor.all
    @competitors = []
    if current_user.email == 'admin'
      @competitors = competitors
    else
      competitors.each do |c|
        if c.rep == current_user.email
          @competitors.push(c)
        end
      end
    end

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

  def list
  end

  def selected
    skus = []
    skus = session[:calllist_skus]
    skus.each do |s|
      select_item = []
      select_item = c
      if params[:called_sku] == select_item[1].to_s
        session[:called_sku] = select_item[0]
        break
      end
    end
    session[:called_from] = params[:called_from]
    session[:called_to] = params[:called_to]
    redirect_to action: "list"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competitor
      @competitor = Competitor.find(params[:id])
    end

    # Build a list of current CSRs
    def build_comp_list
      @sku = []
      sku = []
      tempsku = []
      competitors = Competitor.all
      competitors.each do |c|
        if c.sku && !tempsku.include?(c.sku)
          tempsku.push(c.sku)
        end
      end

      sku = tempsku.sort
      if !session[:called_sku] || session[:called_sku == '']
        # not returning
        session[:called_sku] = sku[0]
      end
      if !session[:called_from] || session[:called_from == '']
        # not returning
        session[:called_from] = Date.today
      end
      if !session[:called_to] || session[:called_to == '']
        # not returning
        session[:called_to] = Date.today
      end

      i = 1
      @selected_sku = 0
      sku.each do |c|
        select_item = []
        select_item.push(c)
        select_item.push(i)
        @sku.push(select_item)
        if c == session[:called_sku]
          @selected_sku = i
        end
        i += 1
      end
      session[:competitor_skus] = @sku

    # Set up the competitor list
      @competitors = []
      averages = []
      averages = Averages.where(sales_date: <= session[:called_to] AND sales_date: >= session[:called_from] AND part_code: == session[:called_sku] AND region: == session[:called_region] AND called_sub_region: == session[:called_sub_region] AND called_cbsa: == session[:called_cbsa])
      @average = averages.first
      avg_price = @average.average_price
      weight_units = @average.weight_lb_units
      averages.each do |a|
        a.average_price += avg_price
        a.average_price /= 2
        avg_price += a.average_price
        a.weight_lb_units += weight_units
        a.weight_lb_units /= 2
        weight_units += a.weight_lb_units
        @average = a
      end

      competitor.each do |c|
        if c.sku
          if c.sku == session[:called_sku]
            # include competitor records that are a direct match for sku
            @competitors.push(c)
          end
        end
      end
    end

    # Add rep to parameters
    def load_rep
      @cp = competitor_params
      if !@cp[:rep]
        @cp[:rep] = current_user.email.upcase
      end
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
