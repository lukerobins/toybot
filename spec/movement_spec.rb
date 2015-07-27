require 'spec_helper'

describe ToyRobot::Movement do
  let(:robot) { ToyRobot::Robot.new }

  describe '#valid_facing?' do
    it 'returns true if valid facing' do
      expect(robot.valid_facing? :south).to be true
    end

    it 'returns false if invalid facing' do
      expect(robot.valid_facing? :southwest).to be false
    end
  end

  describe '#turn' do
    context 'facing :west'do
      before do
        robot.position = ToyRobot::Position.new 1, 1, :west
      end

      it 'returns :north if turning :right and facing :west' do
        expect(robot.turn(:right)).to eq :north
      end

      it 'returns :south if turning :left and facing :west' do
        expect(robot.turn(:left)).to eq :south
      end
    end

    context 'facing :north'do
      before do
        robot.position = ToyRobot::Position.new 1, 1, :north
      end

      it 'returns :east if turning :right' do
        expect(robot.turn(:right)).to eq :east
      end

      it 'returns :west if turning :left' do
        expect(robot.turn(:left)).to eq :west
      end
    end

    context 'facing :east'do
      before do
        robot.position = ToyRobot::Position.new 1, 1, :east
      end

      it 'returns :south if turning :right' do
        expect(robot.turn(:right)).to eq :south
      end

      it 'returns :north if turning :left' do
        expect(robot.turn(:left)).to eq :north
      end
    end

    context 'facing :south'do
      before do
        robot.position = ToyRobot::Position.new 1, 1, :south
      end

      it 'returns :west if turning :right' do
        expect(robot.turn(:right)).to eq :west
      end

      it 'returns :east if turning :left' do
        expect(robot.turn(:left)).to eq :east
      end
    end

    context 'facing :west'do
      before do
        robot.position = ToyRobot::Position.new 1, 1, :west
      end

      it 'returns :north if turning :right and facing :west' do
        expect(robot.turn(:right)).to eq :north
      end

      it 'returns :south if turning :left and facing :west' do
        expect(robot.turn(:left)).to eq :south
      end
    end
  end

  describe '#new_positon' do
    before do
      robot.position = position
    end

    context "facing :north" do
      let(:position) { ToyRobot::Position.new(1, 2, :north) }
      let(:expected_position) { ToyRobot::Position.new(1, 3,:north) }

      it 'returns position of y + 1' do
        expect(robot.new_position).to eq expected_position
      end
    end

    context "facing :east" do
      let(:position) { ToyRobot::Position.new(1, 2, :east) }
      let(:expected_position) { ToyRobot::Position.new(2, 2, :east) }

      it 'returns position of x + 1' do
        expect(robot.new_position).to eq expected_position
      end
    end

    context "facing :south" do
      let(:position) { ToyRobot::Position.new(1, 2, :south) }
      let(:expected_position) { ToyRobot::Position.new(1,1,:south) }

      it 'returns position of y - 1' do
        expect(robot.new_position).to eq expected_position
      end
    end

    context "facing :west" do
      let(:position) { ToyRobot::Position.new(1, 2, :west) }
      let(:expected_position) { ToyRobot::Position.new(0, 2, :west) }

      it 'returns position of x - 1' do
        expect(robot.new_position).to eq expected_position
      end
    end
  end
end
