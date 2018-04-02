require 'juice_bar'

describe '#juicer_gimme' do
  subject { juicer_gimme(my_request, at) }

  context 'beet juice' do
    let(:my_request) { {'Beet Juice' => 1} }
    context 'regular hours' do
      let(:at) { '13:00' }

      let(:my_drinks) { ['Beet Juice'] }
      let(:my_bill) { 5.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'half price mango hours' do
      let(:at) { '15:00' }

      let(:my_drinks) { ['Beet Juice'] }
      let(:my_bill) { 5.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'free cleansing shot hours' do
      let(:at) { '21:00' }

      let(:my_drinks) { ['Beet Juice', 'Cleansing Shot'] }
      let(:my_bill) { 5.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end
  end

  context 'mangotini' do
    let(:my_request) { { 'Mangotini' => 1 } }

    context 'regular hours' do
      let(:at) { '13:00' }

      let(:my_drinks) { ['Mangotini'] }
      let(:my_bill) { 7.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'free cleansing shot hour' do
      let(:at) { '21:00' }

      let(:my_drinks) { ['Mangotini'] }
      let(:my_bill) { 7.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'half price mango hours' do
      let(:at) { '15:00' }

      let(:my_drinks) { ['Mangotini'] }
      let(:my_bill) { 3.5 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end
  end

  context 'mangohattan' do
    let(:my_request) { { 'Mangohattan' => 1 } }

    context 'regular hours' do
      let(:at) { '17:00' }

      let(:my_drinks) { ['Mangohattan'] }
      let(:my_bill) { 7.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'free cleansing shot hour' do
      let(:at) { '21:00' }

      let(:my_drinks) { ['Mangohattan'] }
      let(:my_bill) { 7.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'half price mango hours' do
      let(:at) { '15:00' }

      let(:my_drinks) { ['Mangohattan'] }
      let(:my_bill) { 3.5 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end
  end

  context 'cleansing shot' do
    let(:my_request) { { 'Cleansing Shot' => 1 } }

    context 'regular hours' do
      let(:at) { '13:00' }

      let(:my_drinks) { ['Cleansing Shot'] }
      let(:my_bill) { 3.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'half price mango hours' do
      let(:at) { '15:00' }

      let(:my_drinks) { ['Cleansing Shot'] }
      let(:my_bill) { 3.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'free cleansing shot hours' do
      let(:my_request) do
        {
          'Beet Juice' => 1,
          'Cleansing Shot' => 1
        }
      end
      let(:at) { '21:00' }

      let(:my_drinks) { ['Beet Juice', 'Cleansing Shot', 'Cleansing Shot'] }
      let(:my_bill) { 8.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end
  end

  context 'multiple drinks' do
    context 'regular hours' do
      let(:my_request) do
        {
          'Beet Juice' => 1,
          'Cleansing Shot' => 1,
          'Mangotini' => 1,
          'Mangohattan' => 1
        }
      end
      let(:at) { '13:00' }

      let(:my_drinks) do
        a_collection_containing_exactly('Beet Juice', 'Cleansing Shot', 'Mangohattan', 'Mangotini')
      end
      let(:my_bill) { 22.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'free cleansing shot hours' do
      let(:my_request) do
        {
          'Beet Juice' => 2,
          'Cleansing Shot' => 1
        }
      end
      let(:at) { '21:00' }

      let(:my_drinks) { ['Beet Juice', 'Beet Juice', 'Cleansing Shot', 'Cleansing Shot', 'Cleansing Shot'] }
      let(:my_bill) { 13.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end
  end

  context 'future promo' do
    let(:my_request) do
      {
        'Mangotini' => 1,
        'Mangohattan' => 1
      }
    end
    let(:my_drinks) { ['Mangohattan', 'Mangotini'] }

    context 'during Half Price Mangos' do
      skip 'This works but only because we do not support the new promotion'

      let(:at) { '14:15' }

      let(:my_bill) { 7.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'during Free Cleansing Shots' do
      skip 'This works but only because we do not support the new promotion'

      let(:my_request) do
        {
          'Mangotini' => 1,
          'Mangohattan' => 1,
          'Beet Juice' => 1
        }
      end
      let(:my_drinks) { ['Beet Juice', 'Cleansing Shot', 'Mangohattan', 'Mangotini'] }

      let(:at) { '20:15' }

      let(:my_bill) { 19.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'during no other happy hours' do
      before do
        pending 'This does not work since we do not support the new promotion'
      end

      let(:at) { '16:15' }

      let(:my_bill) { 10.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end
  end
end
