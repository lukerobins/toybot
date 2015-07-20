require 'spec_helper'
require 'robot'

describe Robot do
  let(:robot)    { Robot.new }

  describe 'unplaced robot' do
    it 'has no x position' do
      expect(robot.x).to be nil
    end

    it 'has no y position' do
      expect(robot.y).to be nil
    end

    it 'has no facing' do
      expect(robot.facing).to be nil
    end

    it 'has no tabletop' do
      expect(robot.tabletop).to be nil
    end
  end
end
