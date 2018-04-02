describe '#bartender_gimme' do
  subject { bartender_gimme(my_request, at) }

  context 'beet juice' do
    context 'regular hours' do
      let(:my_request) { { beet_juice: 1 } }
      let(:at) { '13:00' }

      let(:my_order) { Order.new(['Beet Juice'], 5.0) }

      it { is_expected.to be(my_order) }
    end
  end
end
