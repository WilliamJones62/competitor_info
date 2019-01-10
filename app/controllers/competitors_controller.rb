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
      format.html { redirect_to competitors_url, notice: 'Competitor was successfully deleted.' }
    end
  end

  def list
  end

  def selected
    $sku.each do |s|
      select_item = []
      select_item = s
      if params[:called_sku] == select_item[1].to_s
        session[:called_sku] = select_item[0]
        break
      end
    end
    $region.each do |s|
      select_item = []
      select_item = s
      if params[:called_region] == select_item[1].to_s
        session[:called_region] = select_item[0]
        break
      end
    end
    $subregion.each do |s|
      select_item = []
      select_item = s
      if params[:called_subregion] == select_item[1].to_s
        session[:called_subregion] = select_item[0]
        break
      end
    end
    $cbsa.each do |s|
      select_item = []
      select_item = s
      if params[:called_cbsa] == select_item[1].to_s
        session[:called_cbsa] = select_item[0]
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

    # Build a list of competitors
    def build_comp_list
      if !$sku
        @sku = []
        sku = []
        tempsku = []
        @region = []
        @region_single = []
        tempregion = []
        @subregion = []
        @subregion_single = []
        tempsubregion = []
        @cbsa = []
        cbsa = []
        tempcbsa = []
        @allsku = []
        @allregion = []
        @allsubregion = []
        @allcbsa = []
        prices = CompetitorInfoPrice.all
        prices.each do |c|
          if c.part_code && !tempsku.include?(c.part_code)
            tempsku.push(c.part_code)
          end
          if c.div_name && !tempregion.include?(c.div_name)
            tempregion.push(c.div_name)
          end
          if c.csa_name && !tempsubregion.include?(c.csa_name)
            tempsubregion.push(c.csa_name)
          end
          if c.cbsa_name && !tempcbsa.include?(c.cbsa_name)
            tempcbsa.push(c.cbsa_name)
          end
          @allsku.push(c.part_code)
          if c.div_name
            datastr = c.div_name.gsub(', ', '*')
            @allregion.push(datastr.gsub(' ', '~'))
          else
            @allregion.push(c.div_name)
          end
          if c.csa_name
            datastr = c.csa_name.gsub(', ', '*')
            @allsubregion.push(datastr.gsub(' ', '~'))
          else
            @allsubregion.push(c.csa_name)
          end
          if c.cbsa_name
            datastr = c.cbsa_name.gsub(', ', '*')
            @allcbsa.push(datastr.gsub(' ', '~'))
          else
            @allcbsa.push(c.cbsa_name)
          end
        end

        sku = tempsku.sort
        region = tempregion.sort
        subregion = tempsubregion.sort
        cbsa = tempcbsa.sort
        if !session[:called_sku] || session[:called_sku == '']
          # not returning
          session[:called_sku] = sku[0]
        end
        if !session[:called_region] || session[:called_region == '']
          # not returning
          session[:called_region] = region[0]
        end
        if !session[:called_subregion] || session[:called_subregion == '']
          # not returning
          session[:called_subregion] = subregion[0]
        end
        if !session[:called_cbsa] || session[:called_cbsa == '']
          # not returning
          session[:called_cbsa] = cbsa[0]
        end
        if !session[:called_from] || session[:called_from == '']
          # not returning
          now = Date.today
          session[:called_from] = now - 6
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
        $sku = @sku
        i = 1
        @selected_region = 0
        region.each do |c|
          select_item = []
          select_item.push(c)
          select_item.push(i)
          @region.push(select_item)
          if c == session[:called_region]
            @selected_region = i
          end
          i += 1
        end
        $region = @region
        i = 1
        @selected_subregion = 0
        subregion.each do |c|
          select_item = []
          select_item.push(c)
          select_item.push(i)
          @subregion.push(select_item)
          if c == session[:called_subregion]
            @selected_subregion = i
          end
          i += 1
        end
        $subregion = @subregion
        i = 1
        @selected_cbsa = 0
        cbsa.each do |c|
          select_item = []
          select_item.push(c)
          select_item.push(i)
          @cbsa.push(select_item)
          if c == session[:called_cbsa]
            @selected_cbsa = i
          end
          i += 1
        end
        $cbsa = @cbsa
      end
    # Set up the competitor list
      @competitors = []
      averages = []
      if session[:called_region] == ''
        averages = CompetitorInfoPrice.where({sale_date: session[:called_from]..session[:called_to], part_code: session[:called_sku]})
      elsif session[:called_subregion] == ''
        averages = CompetitorInfoPrice.where({sale_date: session[:called_from]..session[:called_to], part_code: session[:called_sku], div_name: session[:called_region]})
      elsif session[:called_cbsa] == ''
        averages = CompetitorInfoPrice.where({sale_date: session[:called_from]..session[:called_to], part_code: session[:called_sku], div_name: session[:called_region], csa_name: session[:called_subregion]})
      else
        averages = CompetitorInfoPrice.where({sale_date: session[:called_from]..session[:called_to], part_code: session[:called_sku], div_name: session[:called_region], csa_name: session[:called_subregion], cbsa_name: session[:called_cbsa]})
      end
      if averages.length > 0
        @price_data = true
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
      else
        @price_data = false
      end

      competitor = Competitor.all
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
      params.require(:competitor).permit(:rep, :competitor, :comp_type, :dart_mkt, :zip, :direct, :effective, :category, :sub_category, :description, :brand, :sub_brand, :uom, :weight, :price, :price_lb, :fresh, :sku, :dart_desc, :dart_price, :avg_price, :dart_uom, :list_price_var, :avg_price_var, :customer, :lb_in_reg, :lb_in_sub_reg, :lb_in_csa, :source, :delivery, :dart_delivery, :abf, :waterchilled, :send_all, :grade, :specs, :heritage, :breed, :grass_fed, :organic, :region, :subregion, :cbsa)
    end
end
