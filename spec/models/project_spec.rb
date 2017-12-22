require 'rails_helper'

RSpec.describe Project, :type => :model do
  before :each do
    @house = House.create(:address => "123 Easy Street, 48213")
    @project = Project.create(:name => "Fix Stove")
    @material = Material.create(:name => "Liquid Ants", :quantity_on_hand => "1")
    @house.projects << @project
  end

  it 'belongs to house' do
    expect(@house.projects).to include(@project)
  end

  it 'has many items' do
    expect(@project.items.first).to eq(@item)
  end

  it 'has many materials through items' do
    @project.items.create(material_id: @material.id)
    expect(@project.materials).to include(@material)
  end

end
