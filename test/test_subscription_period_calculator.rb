require 'minitest/autorun'
require 'subscription_period_calculator'

class SubscriptionPeriodCalculatorTest < Minitest::Test
  describe 'invalid params' do
    it 'should return missing_currency message' do
      assert_equal SubscriptionPeriodCalculator.period(amount: 10, currency: ''), 'Invalid Params: Missing currency parameter.'
    end
  end

  describe 'invalid currency message' do
    it 'Should return invalid currency typr message' do
      assert_match /Invalid Currency/, SubscriptionPeriodCalculator.period(amount: 10, currency: 'UTC')
    end
  end

  describe "Test Calculator with USD value" do
    it "will return 7" do
      days = SubscriptionPeriodCalculator.period(amount: 12.99, currency: 'USD')
      assert_equal days, 7
    end
  end
  
  describe "Test Calculator with USD value" do
    it "will return 13" do
      days = SubscriptionPeriodCalculator.period(amount: 25, currency: 'USD')
      assert_equal days, 13
    end
  end

  describe "Test Calculator with USD value" do
    it "will return 90" do
      days = SubscriptionPeriodCalculator.period(amount: 75, currency: 'USD')
      assert_equal days, 90
    end
  end

  describe "Test Calculator with USD value" do
    it "will return 360" do
      days = SubscriptionPeriodCalculator.period(amount: 300, currency: 'USD')
      assert_equal days, 360
    end
  end

  describe "Test Calculator with USD value" do
    it "will return 120" do
      days = SubscriptionPeriodCalculator.period(amount: 100, currency: 'USD')
      assert_equal days, 120
    end
  end

  describe "Test Calculator with USD value" do
    it "will return 108" do
      days = SubscriptionPeriodCalculator.period(amount: 90, currency: 'USD')
      assert_equal days, 108
    end
  end

  describe "test calculator with BTC value" do
    it "will return 6" do
      assert_equal SubscriptionPeriodCalculator.period(amount: 0.00023, currency: 'BTC'), 6
    end
  end

  describe 'test calculator with BTC value' do
    it 'will return 56963' do
      assert_equal SubscriptionPeriodCalculator.period(amount: 1, currency: 'BTC'), 56963
    end
  end
end
