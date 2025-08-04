require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Transaction.delete_all
  end
   test "try to create a transaction without both info" do
     transaction = Transaction.new
     assert_not transaction.save
   end

    test "try to create a transaction with only one info" do
     transaction = Transaction.new(valor: "1.99")
     assert_not transaction.save

     transaction = Transaction.new(dataHora: "2020-08-07T12:31:56.789-03:00")
     assert_not transaction.save
   end

    test "try to create a transaction with right info" do
     transaction = Transaction.new(valor: "1.99", dataHora: "2020-08-07T12:31:56.789-03:00")
     assert transaction.save
   end

   test "try to create a transaction with info date in the future" do
     transaction = Transaction.new(valor: "1.99", dataHora: "2040-08-07T12:31:56.789-03:00")
     assert_not transaction.persisted?
   end

    test "try to create a transaction with info negative value" do
     transaction = Transaction.new(valor: "-1.99", dataHora: "2020-08-07T12:31:56.789-03:00")
     assert_not transaction.persisted?
   end
end
