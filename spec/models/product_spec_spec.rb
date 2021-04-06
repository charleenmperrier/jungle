require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "saves to db with all areas filled in" do
      @category = Category.new(name: 'new')
      @category.save!
      @product = Product.new(
        name: 'new name',
        price: 300,
        quantity: 2,
        category_id: @category.id
      )
      @product.save!
      expect(@product.id).to be_present
    end

    it "validates name" do
      @product = Product.new
      @product.name = ''
      @product.validate
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it "validates price" do
      @product = Product.new
      @product.price = nil
      @product.validate
      expect(@product.errors[:price]).to include("can't be blank")
    end

    it "validates quantity" do
      @product = Product.new
      @product.quantity = nil
      @product.validate
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it "validates category" do
      @product = Product.new
      @product.category_id = nil
      @product.validate
      expect(@product.errors[:category]).to include("can't be blank")
    end

  end
end
