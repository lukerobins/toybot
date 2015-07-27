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
