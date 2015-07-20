require 'spec_helper'
require 'tabletop'

describe Tabletop do

  let!(:tabletop) { Tabletop.new( 7,7 ) }

  describe '#height' do
    it 'returns tabletop height' do
      expect(tabletop.height).to eq 7
    end
  end

  describe '#width' do
    it 'returns tabletop width' do
      expect(tabletop.width).to eq 7
    end
  end

  describe '#valid_position?' do
    it 'returns true if x and y within tabletop' do
      expect(tabletop.valid_position? 2,6).to be true
    end

    it 'returns false if x outside tabletop' do
      expect(tabletop.valid_position? 8,6).to be false
    end

    it 'returns false if y outside tabletop' do
      expect(tabletop.valid_position? 1,9).to be false
    end
  end
end
