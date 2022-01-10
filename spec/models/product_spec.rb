require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    # before do
      # need to create 'category' 
    before do
      @category = Category.new(:name => "Electronics")
    end 
    # it block
     # test product with all fields
    it 'is valid with all valid attribute' do
      # need to create product of that category
      @product = Product.new(:name => "Any Product", :price => 2_483.75 , :quantity => 2, :category => @category)
      expect(@product).to be_valid
    end
    #  # set test field to be nil
    # expect(record.errors[:email]).to include("can't be blank") 
    #   # test error message in error array
    # it 'is not valid without name attribute'
    it 'is not valid without name attribute' do
      # need to create product of that category
      @product = Product.new(:name => nil, :price => 2_483.75 , :quantity => 2, :category => @category)
      expect(@product).to_not be_valid
      expect(@product.errors[:name]).to include("can't be blank") 
    end
    # it 'is not valid without price attribute'
    it 'is not valid without price attribute' do
      # need to create product of that category
      @product = Product.new(:name => 'Any Product', :quantity => 2, :category => @category)
      expect(@product).to_not be_valid
      expect(@product.errors[:price]).to include("can't be blank") 
    end
    # it 'is not valid without quantity attribute'
    it 'is not valid without quantity attribute' do
      # need to create product of that category
      @product = Product.new(:name => 'Any Product', :price => 2_483.75 , :quantity => nil, :category => @category)
      expect(@product).to_not be_valid
      expect(@product.errors[:quantity]).to include("can't be blank") 
    end
    # it 'is not valid without category attribute'
    it 'is not valid without category attribute' do
      # need to create product of that category
      @product = Product.new(:name => 'Any Product', :price => 2_483.75 , :quantity => 3, :category => nil)
      expect(@product).to_not be_valid
      expect(@product.errors[:category]).to include("can't be blank") 
    end
  end
end
