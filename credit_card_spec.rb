require 'rspec'
require './credit_card'

describe CreditCard do
  describe '#valid?' do
    context 'expired' do
      it 'is not valid' do
        cc = CreditCard.new('3843111122223333', '02/17', 'Visa')
        expect(cc).not_to be_valid
      end
    end
  end

  describe '#number_is_right_length?' do
    context 'no spaces' do
      context 'right length' do
        it 'returns true' do
          valid = CreditCard.number_is_right_length?('Visa', '3843111122223333')
          expect(valid).to be true
        end
      end
    end
  end

  describe '#expired?' do
    context 'expired' do
      it 'returns true' do
        cc = CreditCard.new('3843111122223333', '02/17', 'Visa')
        expect(cc).to be_expired
      end
    end

    context 'not expired' do
      it 'returns false' do
        cc = CreditCard.new('3843111122223333', '02/30', 'Visa')
        expect(cc).not_to be_expired
      end
    end
  end
end