require 'spec_helper'
require 'robot'

describe Robot do
  let(:robot)    { Robot.new }

  describe 'unplaced robot' do
    it 'has no position' do
      expect(robot.position).to be nil
    end

    it 'has no tabletop' do
      expect(robot.tabletop).to be nil
    end
  end
end
