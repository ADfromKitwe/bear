require 'test_helper'

class CustomersTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  
  test "Navigation is available to the Customer page" do
    customer = customers(:kalusha)
    visit customers
    within ("table") do
      click_link customer.name
      assert_equal customer_path(customer), current_path
    end
  end
  
end