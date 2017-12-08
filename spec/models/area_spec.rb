require 'rails_helper'

RSpec.describe Area, :type => :model do
  before :each do
    @house = House.create(:address => "123 Easy Street, 48213")
    @area = Area.create(:name => "Kitchen")
    @house.areas << @area
  end

  it 'belongs to house' do
    expect(@area.house).to eq(@house)
  end

end
