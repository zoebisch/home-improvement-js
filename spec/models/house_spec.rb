require 'rails_helper'

RSpec.describe House, :type => :model do

  it 'has many areas' do
    binding.pry
    House.areas << Area.first
    expect(House.areas).to include(Area.first)
  end

  it 'has many projects' do
    House.projects << Project.first
    expect(House.projects).to include(Project.first)
  end

end
