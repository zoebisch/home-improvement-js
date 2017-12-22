require 'rails_helper'

RSpec.describe House, :type => :model do
  before :each do
    @house = House.create(:address => "123 Easy Street, 48213")
    @project = Project.create(:name => "Fix Stove")
  end

  it 'has many projects' do
    @house.projects << @project
    expect(@house.projects).to include(@project)
  end

end
