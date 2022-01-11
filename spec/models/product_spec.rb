require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    # before do
      # need to create 'category' 
    before do
      @category = Category.new(:name => "Electronics")
      @category.save
    end 

    # it block
     # test product with all fields
    it 'is valid with all valid attribute' do
      # need to create product of that category
      @product = Product.new(:name => "Any Product", :price => 2_483.75 , :quantity => 2, :category => @category)
      @product.save
      expect(@product).to be_valid
    end
      # set test field to be nil
      # test error message in error array
    # it 'is not valid without name attribute'
    it 'is not valid without name attribute' do
      # need to create product of that category
      @product = Product.new(:name => nil, :price => 2_483.75 , :quantity => 2, :category => @category)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).not_to be_empty
      expect(@product.errors.full_messages).to include("Name can't be blank") 
    end
    # it 'is not valid without price attribute'
    it 'is not valid without price attribute' do
      # need to create product of that category
      @product = Product.new(:name => 'Any Product', :quantity => 2, :category => @category)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).not_to be_empty
      expect(@product.errors.full_messages).to include("Price can't be blank") 
    end
    # it 'is not valid without quantity attribute'
    it 'is not valid without quantity attribute' do
      # need to create product of that category
      @product = Product.new(:name => 'Any Product', :price => 2_483.75 , :quantity => nil, :category => @category)
      @product.save
      expect(@product.errors.full_messages).not_to be_empty
   
      expect(@product.errors.full_messages).to include("Quantity can't be blank")  
    end
    # it 'is not valid without category attribute'
    it 'is not valid without category attribute' do
      # need to create product of that category
      @product = Product.new(:name => 'Any Product', :price => 2_483.75 , :quantity => 3, :category => nil)
      @product.save
      expect(@product.errors.full_messages).not_to be_empty
      expect(@product.errors.full_messages).to include("Category can't be blank")  
    end
  end
end
