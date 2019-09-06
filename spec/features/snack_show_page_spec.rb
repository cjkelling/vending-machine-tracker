require 'rails_helper'

describe 'Snack Show Page' do
  before :each do
    @sam = Owner.create(name: "Sam's Snacks")
    @candy_bar = @sam.machines.create(location: "Sam's Candy")
    @kit_kat = @candy_bar.snacks.create(name: 'Kit-Kat', price: 2)
  end

  it 'Shows the name, price, locations, average price for the location, and count of different items' do
    visit "/snacks/#{@kit_kat.id}"
    save_and_open_page

    expect(page).to have_content('Name: Kit-Kat')
    expect(page).to have_content('Price: 2')
    expect(page).to have_content("Locations: Sam's Candy")
    expect(page).to have_content('average price of $2.0')
    expect(page).to have_content('1 kinds of snacks')
  end
end
