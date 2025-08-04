require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Transaction.delete_all
  end
   test "try to create a transaction without info" do
     transaction = Transaction.new
     assert_not transaction.save
   end
end
