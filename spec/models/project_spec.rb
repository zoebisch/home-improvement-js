require 'rails_helper'

RSpec.describe Project, :type => :model do
  before :each do
    @house = House.create(:address => "123 Easy Street, 48213")
    @area = Area.create(:name => "Kitchen")
    @project = Project.create(:name => "Fix Stove")
    @material = Material.create(:name => "Liquid Ants")
    @item = Item.create(:material_id => @material.id)
    @house.areas << @area
    @house.projects << @project
    @project.items << @item
  end

  it 'belongs to house' do
    expect(@house.projects).to include(@project)
  end

  it 'has many areas through house' do
    expect(@project.areas.first).to eq(@house.areas.first)
  end

  it 'has many item' do
    expect(@project.items.first).to eq(@item)
  end

  it 'has many materials through items' do
    expect(@project.materials).to include(@material)
  end

end
