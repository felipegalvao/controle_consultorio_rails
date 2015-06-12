require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Controle de Consultório"
  end
  
  test "should get dashboard" do
    get :dashboard
    assert_response :success
    assert_select "title", "Dashboard | Controle de Consultório"
  end
  
end
