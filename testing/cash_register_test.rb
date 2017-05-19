require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

# class CashRegisterTest < Minitest::Test

  # def test_accept_money
  #   register = CashRegister.new(1000)
  #   transaction = Transaction.new(20)
  #   transaction.amount_paid = 20

  #   previous_amount = register.total_money
  #   register.accept_money(transaction)
  #   current_amount = register.total_money

  #   assert_equal previous_amount + 20, current_amount
  # end

  # def test_change
  #   register = CashRegister.new(1000)
  #   transaction = Transaction.new(20)
  #   transaction.amount_paid = 30
    

  #   assert_equal(10, register.change(transaction))
  # end

  # def test_give_receipt
  #   register = CashRegister.new(1000)
  #   transaction = Transaction.new(20)
  #   output = "You've paid $20."
  #   puts transaction.item_cost

  #   assert_equal(output, register.give_receipt(transaction))
    
  # end

  # def test_prompt_for_payment
  #   transaction = Transaction.new(20)
  #   p transaction.prompt_for_payment
  # end
# end

# class TransactionTest < Minitest::Test
#   def test_prompt_for_payment
#     transaction = Transaction.new(30)
#     input = StringIO.new('30\n')
#     transaction.prompt_for_payment(input: input)
#     assert_equal 30, transaction.amount_paid
#   end
# end


class CashRegisterTest < Minitest::Test

  def setup
    @register = CashRegister.new(0)
    @transaction = Transaction.new(50)
  end

  # def test_accept_money
  #   @transaction.prompt_for_payment
  #   @register.accept_money(@transaction)
  #   assert_equal(50, @register.total_money)
  # end

  # def test_change
  #   @transaction.amount_paid = 70
  #   assert_equal(20, @register.change(@transaction))
  # end

  # def test_give_receipt
  #   @transaction.amount_paid = 20
  #   output = "You've paid $50.\n"
  #   assert_equal(output, @register.give_receipt(@transaction))
  # end

  # def test_promt_for_payment
  #   @transaction.prompt_for_payment($stdin 50)
  # end

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    input = StringIO.new('30\n')
    transaction.prompt_for_payment(input: input)
    assert_equal 30, transaction.amount_paid
  end
end