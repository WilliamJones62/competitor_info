require 'test_helper'

class CompetitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @competitor = competitors(:one)
  end

  test "should get index" do
    get competitors_url
    assert_response :success
  end

  test "should get new" do
    get new_competitor_url
    assert_response :success
  end

  test "should create competitor" do
    assert_difference('Competitor.count') do
      post competitors_url, params: { competitor: { abf: @competitor.abf, avg_price: @competitor.avg_price, avg_price_var: @competitor.avg_price_var, brand: @competitor.brand, breed: @competitor.breed, category: @competitor.category, comp_type: @competitor.comp_type, competitor: @competitor.competitor, customer: @competitor.customer, dart_delivery: @competitor.dart_delivery, dart_desc: @competitor.dart_desc, dart_mkt: @competitor.dart_mkt, dart_price: @competitor.dart_price, dart_uom: @competitor.dart_uom, delivery: @competitor.delivery, description: @competitor.description, direct: @competitor.direct, effective: @competitor.effective, fresh: @competitor.fresh, grade: @competitor.grade, grass_fed: @competitor.grass_fed, heritage: @competitor.heritage, lb_in_csa: @competitor.lb_in_csa, lb_in_reg: @competitor.lb_in_reg, lb_in_sub_reg: @competitor.lb_in_sub_reg, list_price_var: @competitor.list_price_var, organic: @competitor.organic, price: @competitor.price, price_lb: @competitor.price_lb, rep: @competitor.rep, send_all: @competitor.send_all, sku: @competitor.sku, source: @competitor.source, specs: @competitor.specs, sub_brand: @competitor.sub_brand, sub_category: @competitor.sub_category, uom: @competitor.uom, waterchilled: @competitor.waterchilled, weight: @competitor.weight, zip: @competitor.zip } }
    end

    assert_redirected_to competitor_url(Competitor.last)
  end

  test "should show competitor" do
    get competitor_url(@competitor)
    assert_response :success
  end

  test "should get edit" do
    get edit_competitor_url(@competitor)
    assert_response :success
  end

  test "should update competitor" do
    patch competitor_url(@competitor), params: { competitor: { abf: @competitor.abf, avg_price: @competitor.avg_price, avg_price_var: @competitor.avg_price_var, brand: @competitor.brand, breed: @competitor.breed, category: @competitor.category, comp_type: @competitor.comp_type, competitor: @competitor.competitor, customer: @competitor.customer, dart_delivery: @competitor.dart_delivery, dart_desc: @competitor.dart_desc, dart_mkt: @competitor.dart_mkt, dart_price: @competitor.dart_price, dart_uom: @competitor.dart_uom, delivery: @competitor.delivery, description: @competitor.description, direct: @competitor.direct, effective: @competitor.effective, fresh: @competitor.fresh, grade: @competitor.grade, grass_fed: @competitor.grass_fed, heritage: @competitor.heritage, lb_in_csa: @competitor.lb_in_csa, lb_in_reg: @competitor.lb_in_reg, lb_in_sub_reg: @competitor.lb_in_sub_reg, list_price_var: @competitor.list_price_var, organic: @competitor.organic, price: @competitor.price, price_lb: @competitor.price_lb, rep: @competitor.rep, send_all: @competitor.send_all, sku: @competitor.sku, source: @competitor.source, specs: @competitor.specs, sub_brand: @competitor.sub_brand, sub_category: @competitor.sub_category, uom: @competitor.uom, waterchilled: @competitor.waterchilled, weight: @competitor.weight, zip: @competitor.zip } }
    assert_redirected_to competitor_url(@competitor)
  end

  test "should destroy competitor" do
    assert_difference('Competitor.count', -1) do
      delete competitor_url(@competitor)
    end

    assert_redirected_to competitors_url
  end
end
