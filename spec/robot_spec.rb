require 'spec_helper'

describe ToyRobot::Robot do
  let(:robot) { ToyRobot::Robot.new }
  let(:tabletop) { ToyRobot::Tabletop.new(5,5) }

  describe 'unplaced robot' do
    it 'has no position' do
      expect(robot.position).to be nil
    end

    it 'has no tabletop' do
      expect(robot.tabletop).to be nil
    end
  end

  describe '#move' do
    before do
      tabletop.add_toy robot, ToyRobot::Position.new(0,0,:north)
    end

    context 'valid move' do
      let(:expected_position) { ToyRobot::Position.new(0,1,:north) }
      it 'move one :north' do
        robot.move
        expect(robot.position).to eq expected_position
      end
    end

    context 'invalid move' do
      let(:position) {ToyRobot::Position.new(0,0,:south)}

      before do
        tabletop.add_toy(robot, position)
      end

      it 'does not move' do
        robot.move
        expect(robot.position).to eq position
      end
    end
  end

  describe '#turn' do
    context 'unplaced robot' do
      let(:robot) { ToyRobot::Robot.new }

      it 'turn is ignored' do
        robot.turn :left
        expect(robot.position).to be nil
      end
    end

    context 'placed robot' do
      before do
        tabletop.add_toy robot, ToyRobot::Position.new(0,0,:north)
      end

      it 'turns to left to :west' do
        robot.turn :left
        expect(robot.position.facing).to eq :west
      end

      it 'turns to right to :east' do
        robot.turn :right
        expect(robot.position.facing).to eq :east
      end

      it 'throws error on incorrect direction' do
        expect{robot.turn 'RIGHT'}.to raise_error("Cannot turn direction 'RIGHT'")
      end
    end
  end

  describe '#report' do
    context 'unplaced robot' do
      it 'returns not on table' do
        expect(robot.report).to eq 'Robot not on a tabletop'
      end
    end

    context 'placed robot' do
      it 'returns robot position' do
        tabletop.add_toy robot, ToyRobot::Position.new(0,1,:west)
        expect(robot.report).to eq '0,1,WEST'
      end
    end
  end
end
