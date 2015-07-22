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

  describe '#move' do
    let(:robot) do
      tabletop = Tabletop.new(5,5)
      robot = Robot.new
      robot.place(Position.new(0,0,:North),tabletop)
      robot
    end

    context 'valid move' do
      it 'move one :North' do
        robot.move
        expect(robot.position.y).to eq 1
      end

      it 'returns true' do
        expect(robot.move).to be true
      end
    end

    context 'invalid move' do
      let(:position) {Position.new(0,0,:South)}

      before do
        robot.place(position)
      end

      it 'does not move' do
        robot.move
        expect(robot.position).to eq position
      end

      it 'returns false' do
        expect(robot.move).to be false
      end
    end
  end

  describe '#turn' do
    context 'unplaced robot' do
      let(:robot) { Robot.new }
      it 'returns false' do
        expect(robot.turn :left).to be false
      end
    end

    context 'placed robot' do
      let(:robot) do
        tabletop = Tabletop.new(5,5)
        robot = Robot.new
        robot.place(Position.new(0,0,:North),tabletop)
        robot
      end

      it 'returns true' do
        expect(robot.turn :left).to be true
      end

      it 'turns to left to :West' do
        robot.turn :left
        expect(robot.position.facing).to eq :West
      end

      it 'turns to right to :East' do
        robot.turn 'RIGHT'
        expect(robot.position.facing).to eq :East
      end
    end
  end
end
