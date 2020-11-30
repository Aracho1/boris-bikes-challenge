require 'van'
require 'dockingstation'
require 'garage'

describe Van do
  let(:station){ DockingStation.new }
  let(:garage){ Garage.new }

  it 'takes broken bikes from docking stations' do
    station.dock double(:bike, broken: true)    
    subject.collect(station)
    expect(station.broken_bikes).to eq []
  end

  it 'updates the garage with broken bikes' do
    bike = double(:bike, broken: true)
    station.dock bike
    subject.collect(station)
    expect(garage.broken_bikes.include? bike).to be true
  end

  it 'does not collect working bikes' do
    bike = double(:bike, broken: false)
    garage = double(:garage)
    station.dock bike
    subject.collect(station)
    expect(garage.broken_bikes.include? bike).to be false
  end

end

  