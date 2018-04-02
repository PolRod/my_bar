require 'my_juice_bar'

describe '#bartender_gimme' do
  subject { bartender_gimme(my_request, at) }

  context 'beet juice' do
    context 'regular hours' do
      let(:my_request) { [ 'Beet Juice'] }
      let(:at) { '13:00' }

      let(:my_order) { [['Beet Juice'], 5.0] }

      it { is_expected.to eq(my_order) }
    end
  end
end
