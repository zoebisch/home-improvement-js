require 'rails_helper'

RSpec.describe House, :type => :model do
  before :each do
    @house = House.create(:address => "123 Easy Street, 48213")
    @area = Area.create(:name => "Kitchen")
    @project = Project.create(:name => "Fix Stove")
  end

  it 'has many areas' do
    @house.areas << @area
    expect(@house.areas).to include(@area)
  end

  it 'has many projects' do
    @house.projects << @project
    expect(@house.projects).to include(@project)
  end

end
