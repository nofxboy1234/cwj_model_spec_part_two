require 'rspec'
require './credit_card'

describe CreditCard do
  let(:this_year) { Date.today.strftime('%y').to_i }
  let(:future_date) { "02/#{this_year - 1}" }
  let(:past_date) { "02/#{this_year + 1}" }

  describe '#valid?' do
    context 'expired' do
      it 'is not valid' do
        cc = CreditCard.new('1111111111111111', '02/17', 'Visa')
        expect(cc).not_to be_valid
      end
    end
  end

  describe '#number_is_right_length?' do
    context 'no spaces' do
      context 'right length' do
        it 'returns true' do
          cc = CreditCard.new('1111111111111111', future_date, 'Visa')
          expect(cc.number_is_right_length?).to be true
        end
      end
    end

    context 'American Express' do
      it 'needs to be 15 numbers long' do
        cc = CreditCard.new('111111111111111', future_date, 'American Express')
        expect(cc.number_is_right_length?).to be true
      end
    end

    context 'non-American-Express' do
      it 'needs to be 16 numbers long' do
        cc = CreditCard.new('1111111111111111', future_date, 'Visa')
        expect(cc.number_is_right_length?).to be true
      end
    end
  end

  describe '#expired?' do
    context 'expired' do
      it 'returns true' do
        cc = CreditCard.new('1111111111111111', future_date, 'Visa')
        expect(cc).to be_expired
      end
    end

    context 'not expired' do
      it 'returns false' do
        cc = CreditCard.new('1111111111111111', past_date, 'Visa')
        expect(cc).not_to be_expired
      end
    end
  end
end