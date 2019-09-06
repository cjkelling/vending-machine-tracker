require 'rails_helper'

describe 'Vending Machine Show Page' do
  before :each do
    @sam = Owner.create(name: "Sam's Snacks")
    @candy_bar = @sam.machines.create(location: "Sam's Candy")
    @kit_kat = @candy_bar.snacks.create(name: 'Kit-Kat', price: 1.50)
    @snickers = @candy_bar.snacks.create(name: 'Kit-Kat', price: 2.75)
  end

  it 'I can see all snack for that machine along with the snacks price' do
    visit "/machines/#{@candy_bar.id}"

    expect(page).to have_content(@kit_kat.name)
    expect(page).to have_content(@kit_kat.price)
  end

  it 'I see the average price for all snacks in the machine' do
    visit "/machines/#{@candy_bar.id}"

    expect(page).to have_content(@candy_bar.average_price)
  end
end
