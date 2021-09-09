require_relative '../read_input.rb'

describe ReadInput do
   subject { ReadInput.new() }

  context '#validate_phone' do
    it 'should parse 123-456-7890 &  convert phone format' do
      phone = subject.validate_phone('123-456-7890')
      expect(phone).to eq('1234567890')
    end

     it 'should parse (123)-456-7890 & convert to valid phone format' do
       phone = subject.validate_phone('(123)-456-7890')
       expect(phone).to eq('1234567890')
     end

     it 'should parse +1 123-456-7890 & convert to valid format' do
       phone = subject.validate_phone('+1 123-456-7890')
       expect(phone).to eq('+11234567890')
     end

    it 'should return nil for an invalid number +1123456789099911' do
       phone = subject.validate_phone('+1123456789099911')
       expect(phone).to be(nil)
     end
  end

  context '#validate_date' do
    it 'should parse 12/12/2020 &  convert phone format' do
      date = subject.validate_date('14/12/2020')
      expect(date).to eq('2020-12-14')
    end

    it 'should return nil for an invalid date' do
       date = subject.validate_date('08-17-2020')
       expect(date).to be(nil)
    end

    it 'should return nil for an invalid date format 9/30/19' do
       date = subject.validate_date('9/30/19')
       expect(date).to be(nil)
     end
  end
end
