require 'spec_helper'
require 'robot'
require 'tabletop'

describe Robot do
  let(:robot) { Robot.new }

  describe 'unplaced robot' do
    it 'has no position' do
      expect(robot.position).to be nil
    end

    it 'has no tabletop' do
      expect(robot.tabletop).to be nil
    end
  end

  describe '#place' do
    let(:tabletop) { Tabletop.new(5,5)}

    context 'valid placement' do
      let(:position) { Position.new(2,3,:North) }

      it 'returns true' do
        expect(robot.place(position, tabletop)).to be true
      end

      it 'position is set to placement' do
        robot.place position, tabletop
        expect(robot.position).to eq position
      end

      it 'tabletop is set' do
        robot.place position, tabletop
        expect(robot.tabletop).to eq tabletop
      end

      context 'placing a second time' do
        let(:position2) { Position.new(0,0,:South) }

        it 'position is set to second position' do
          robot.place position, tabletop
          robot.place position2
          expect(robot.position).to eq position2
        end
      end
    end

    context 'invalid placement' do
      let(:position) { Position.new(6,3,:North) }

      it 'returns false' do
        expect(robot.place(position, tabletop)).to be false
      end

      it 'position is unset' do
        robot.place position, tabletop
        expect(robot.position).to be nil
      end

      it 'tabletop is unset' do
        robot.place position, tabletop
        expect(robot.tabletop).to be nil
      end
    end

    context 'placing on a second tabletop' do
      let(:position) { Position.new(3,3,:North) }
      let(:tabletop2) { Tabletop.new(20,20) }

      it 'sets tabletop to second tabletop' do
        robot.place position, tabletop
        robot.place position, tabletop2
        expect(robot.tabletop).to be tabletop2
      end
    end

  end
end
