require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "GAMERES"
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title","Home | #{@base_title}"
  end
  
  test"should get about" do
   get about_path
   assert_response:success
    assert_select "title","About | #{@base_title}"
  end



  test"should get signup" do
   get signup_path
   assert_response:success
    assert_select "title","Signup | #{@base_title}"
  end



end
 