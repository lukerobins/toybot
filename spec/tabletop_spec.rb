require 'spec_helper'

describe ToyRobot::Tabletop do

  let(:tabletop) { ToyRobot::Tabletop.new( 7,7 ) }

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
    it 'returns true if x and y within tabletop and facing is valid' do
      expect(tabletop.valid_position? ToyRobot::Position.new(2, 6, :west)).to be true
    end

    it 'returns false if x outside tabletop' do
      expect(tabletop.valid_position? ToyRobot::Position.new(8, 6, :west)).to be false
    end

    it 'returns false if y outside tabletop' do
      expect(tabletop.valid_position? ToyRobot::Position.new(2, 9, :west)).to be false
    end
  end


  describe '#add_toy' do
    let(:tabletop) { ToyRobot::Tabletop.new(5,5)}
    let(:robot) { ToyRobot::Robot.new }


    context 'valid placement' do
      let(:position) { ToyRobot::Position.new(2,3,:north) }
      before do
        tabletop.add_toy robot, position
      end

      it 'position is set to placement' do
        expect(robot.position).to eq position
      end

      it 'tabletop is set' do
        expect(robot.tabletop).to eq tabletop
      end

      it 'tabletop has_toy' do
        expect(tabletop.has_toy? robot).to be true
      end
    end

    context 'invalid placement' do
      let(:position) { ToyRobot::Position.new(6,3,:north) }
      before do
        tabletop.add_toy robot, position
      end

      it 'position is unset' do
        expect(robot.position).to be nil
      end

      it 'tabletop is unset' do
        expect(robot.tabletop).to be nil
      end

      it 'tabletop does not has_toy' do
        expect(tabletop.has_toy? robot).to be false
      end
    end
  end
end
