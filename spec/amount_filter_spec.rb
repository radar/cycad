require 'spec_helper'
require 'date'

RSpec.describe Cycad::Filters::AmountFilter do
  let(:transaction1) { double(Transaction, amount: 123) }
  let(:transaction2) { double(Transaction, amount: 13) }
  let(:transaction3) { double(Transaction, amount: -5) }
  let(:transaction4) { double(Transaction, amount: -77) }
  let (:transactions) do
    [
      transaction1,
      transaction2,
      transaction3,
      transaction4
    ]
  end

  context 'self.filter_income_only' do
    it 'returns only income transactions' do
      filtered = Cycad::Filters::AmountFilter.filter_income_only(transactions)
      expect(filtered).to contain_exactly(transaction1, transaction2)
    end
  end

  context 'self.filter_expenses_only' do
    it 'returns only expense transactions' do
      filtered = Cycad::Filters::AmountFilter.filter_expenses_only(transactions)
      expect(filtered).to contain_exactly(transaction3, transaction4)
    end
  end
  
  context 'self.filter_amount_range' do
    let(:lower_limit) { -5 }
    let(:upper_limit) { 123 }

    it 'returns transactions within a range of amounts' do
      filtered = Cycad::Filters::AmountFilter.filter_amount_range(
        transactions,
        lower_limit,
        upper_limit
      )
      expect(filtered).to contain_exactly(transaction1, transaction2, transaction3)
    end
  end
end