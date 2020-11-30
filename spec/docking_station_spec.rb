# frozen_string_literal: true

require 'dockingstation'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = double(broken: false)
    subject.dock bike
    expect(subject.release_bike).to be bike
  end

  it 'does not release broken bikes' do
    bike = double(broken: true)
    subject.dock bike
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe 'dock' do
    it 'raises an error when full' do
      bike = double(broken: false)
      subject.capacity.times { subject.dock bike }
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
    end
  end
end
