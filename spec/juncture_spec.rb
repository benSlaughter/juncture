require 'spec_helper'

describe Juncture do
  it 'should be an instance of Class' do
    expect(Juncture).to be_an_instance_of Class
  end

  describe '::new' do
  	it 'creates a new instance of Juncture' do
  		expect(Juncture.new []).to be_an_instance_of Juncture 
  	end
  end

  describe '#inspect' do
  	it 'returns the Juncture object' do
  		expect(Juncture.new([]).inspect).to match(/<Juncture:\S+ State:\S*>/)
  	end
  end

  describe '#state' do
  	it 'returns the current state' do
  		temp = Juncture.new 1, 2, 3
  		expect(temp.state).to be_nil
  	end

  	it 'returns the default state' do
  		temp = Juncture.new 1, 2, 3, default: 1
  		expect(temp.state).to eq 1
  	end
  end

  describe '#set' do
  	it 'sets the current state' do
  		temp = Juncture.new 1, 2, 3
  		temp.set 1
  		expect(temp.state).to eq 1
  	end

  	it 'raises an error if the state is not present' do
  		temp = Juncture.new 1, 2, 3
  		expect{ temp.set 4 }.to raise_error
  	end
  end

  describe '#==' do
    it 'returns true if matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp == 2).to be_true
    end

    it 'returns false if not matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp == 1).to be_false
    end
  end

  describe '#===' do
    it 'returns true if matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp === 2).to be_true
    end

    it 'returns false if not matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp === 1).to be_false
    end
  end

  describe '#<' do
    it 'returns true if matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp < 3).to be_true
    end

    it 'returns false if not matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp < 2).to be_false
    end
  end

  describe '#<=' do
    it 'returns true if matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp <= 2).to be_true
    end

    it 'returns false if not matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp <= 1).to be_false
    end
  end

  describe '#>' do
    it 'returns true if matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp > 1).to be_true
    end

    it 'returns false if not matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp > 2).to be_false
    end
  end

  describe '#>=' do
    it 'returns true if matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp >= 2).to be_true
    end

    it 'returns false if not matching' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp >= 3).to be_false
    end
  end

  describe '#method_missing' do
    it 'forards to the state array' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect(temp[1]).to eq 2
      expect(temp.length).to eq 3
    end

    it 'raises an error to super' do
      temp = Juncture.new 1, 2, 3, default: 2
      expect{ temp.no_response }.to raise_error
    end
  end
end