require 'rails_helper'

RSpec.describe Material, :type => :model do
  before :each do
    @material = Material.create(:name => "Lazer Beetles")
    @item = Item.create()
    @material.items << @item
  end

  it 'has many materials' do
    expect(@material.items).to include(@item)
  end

end
