require 'dockingstation'

describe DockingStation do
 let(:bike) { Bike.new }
 let(:docking_station) { DockingStation.new }

 it "expect docking_station station array to change when dock is called" do
   bike = Bike.new
   expect{docking_station.dock(bike)}.to change{docking_station.station}
 end

  it { is_expected.to respond_to(:release_bike) }

  it 'It should show true' do
    expect(bike.working?).to eq true
  end

  it 'raises an error message when there are no bikes' do
    expect{ docking_station.release_bike }.to raise_error('no bikes available')
  end

  it 'raises an error message when the station is full' do
    #20.times { docking_station.dock Bike.new }
    expect {21.times {docking_station.dock(bike)}}.to raise_error('station is full')
  end

end
