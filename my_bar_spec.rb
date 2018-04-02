require 'my_juice_bar'

describe '#bartender_gimme' do
  subject { bartender_gimme(my_request, at) }

  context 'beet juice' do
    context 'regular hours' do
      let(:my_request) { ['Beet Juice'] }
      let(:at) { '13:00' }

      let(:my_drinks) { ['Beet Juice'] }
      let(:my_bill) { 5.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'free clensing shot hours' do
      let(:my_request) { ['Beet Juice'] }
      let(:at) { '21:00' }

      let(:my_drinks) { ['Beet Juice', 'Cleansing Shot'] }
      let(:my_bill) { 5.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end
  end

  context 'mangotini' do
    context 'regular hours' do
      let(:my_request) { ['Mangotini'] }
      let(:at) { '13:00' }

      let(:my_drinks) { ['Mangotini'] }
      let(:my_bill) { 7.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'half price mango hours' do
      let(:my_request) { ['Mangotini'] }
      let(:at) { '15:00' }

      let(:my_drinks) { ['Mangotini'] }
      let(:my_bill) { 3.5 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end
  end

  context 'mangohattan' do
    context 'regular hours' do
      let(:my_request) { ['Mangohattan'] }
      let(:at) { '13:00' }

      let(:my_drinks) { ['Mangohattan'] }
      let(:my_bill) { 7.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'half price mango hours' do
      let(:my_request) { ['Mangotini'] }
      let(:at) { '15:00' }

      let(:my_drinks) { ['Mangotini'] }
      let(:my_bill) { 3.5 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end
  end

  context 'cleansing shot' do
    context 'regular hours' do
      let(:my_request) { ['Cleansing Shot'] }
      let(:at) { '13:00' }

      let(:my_drinks) { ['Cleansing Shot'] }
      let(:my_bill) { 3.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end

    context 'free clensing shot hours' do
      let(:my_request) { ['Beet Juice', 'Cleansing Shot'] }
      let(:at) { '21:00' }

      let(:my_drinks) { ['Beet Juice', 'Cleansing Shot', 'Cleansing Shot'] }
      let(:my_bill) { 8.0 }

      it { is_expected.to match([my_drinks, my_bill]) }
    end
  end
end
