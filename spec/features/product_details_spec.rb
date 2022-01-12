require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "navigate to product_detail page" do
    # ACT
    visit root_path
    page.find(".product:nth-child(1) .actions .btn-default").click
    
    # save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail', count: 1
  end
end