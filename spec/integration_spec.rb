require 'spec_helper'

describe 'integration tests' do
  let(:test_file1) { 'spec/integration/scenario_1'}
  let(:test_file2) { 'spec/integration/scenario_2'}
  let(:test_file3) { 'spec/integration/scenario_3'}

  it 'reports expected robot position' do
    result = `ruby toy_robot.rb < #{test_file1}`.chomp
    expect(result).to eq '5,3,NORTH'
  end

  it 'reports expected robot position' do
    result = `ruby toy_robot.rb < #{test_file2}`.chomp
    expect(result).to eq '1,1,EAST'
  end

  it 'reports expected robot position' do
    result = `ruby toy_robot.rb < #{test_file3}`.chomp
    expect(result).to eq '1,2,EAST'
  end

end
