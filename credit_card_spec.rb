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
          cc = CreditCard.new('3843111122223333', '02/17', 'Visa')
          expect(cc.number_is_right_length?).to be true
        end
      end
    end
  end
end