class SubscriptionPeriodCalculator
  ALLOWED_CURRENCIES = %w(USD BTC)
  BITCOIN_TO_DOLLAR_RATE = 47469.10
  ONE_WEEK_SUBSCRIPTION_COST_IN_DOLLARS = 12.99
  THREE_MONTH_SUBSCRIPTION_COST_IN_DOLLARS = 75.0

  class << self

    def period(amount:, currency:)
      amount = amount.to_f
      currency = currency.to_s
      return 0 if amount <= 0
      return 'Invalid Params: Missing currency parameter.' if currency.strip.empty?
      return "Invalid Currency: Allowed currencies are #{ALLOWED_CURRENCIES.join(', ')}" unless ALLOWED_CURRENCIES.include?(currency.to_s)

      amount = amount * BITCOIN_TO_DOLLAR_RATE if currency == 'BTC' #convert bitcoin to dollars
      return 90 if amount == THREE_MONTH_SUBSCRIPTION_COST_IN_DOLLARS

      per_day_cost = 
        if amount > THREE_MONTH_SUBSCRIPTION_COST_IN_DOLLARS
          (THREE_MONTH_SUBSCRIPTION_COST_IN_DOLLARS / 90)
        else
          (ONE_WEEK_SUBSCRIPTION_COST_IN_DOLLARS / 7)
        end

      subscription_period_in_days = (amount / per_day_cost).round(half: :down)
      subscription_period_in_days
    end

  end
end
