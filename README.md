# Installation

* cd subscription_period_calculator
* gem build subscription_period_calculator.gemspec
* gem install ./subscription_period_calculator-0.0.0.gem

# Usage

go to `irb` and start using the calculator

# exmaple

```
  SubscriptionPeriodCalculator.period(amount: 10, currency: 'UTC')
  SubscriptionPeriodCalculator.period(amount: 10, currency: 'BTC')
```
