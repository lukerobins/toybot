require 'spec_helper'
require 'tabletop'

describe Tabletop do

  let!(:tabletop) { Tabletop.new( 7,7 ) }

  describe '#height' do
    it 'return tabletop height' do
      expect(tabletop.height).to eq 7
    end
  end

  describe '#width' do
    it 'return tabletop width' do
      expect(tabletop.width).to eq 7
    end
  end
end
