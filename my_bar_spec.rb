describe '#bartender_gimme' do
  subject { bartender_gimme(my_request, at) }

  context 'beer' do
    context 'regular hours' do
      let(:my_request) { { beer: 1 } }
      let(:at) { '13:00' }

      let(:my_order) { Order.new([['Glass', 'Beer']], 5.0) }

      it { is_expected.to be(my_order) }
    end
  end
end
