require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    # validation tests/examples here
    it 'should have a valid product' do
      @category = Category.create(name:"Tech")
      product = Product.new(
        name: 'Bose Headphone',
        price: 20000,
        quantity: 10,
        category_id: @category.id
      )
      expect(product).to (be_valid)
      # be_valid => meaning all of the ActiveModel::Validations passed and no errors exist.
    end

    it 'should not save without valid name' do
      @category = Category.create(name:"Tech")
      product = Product.new(
        name: nil,
        price: 20000,
        quantity: 10,
        category_id: @category.id
      )
      expect(product).to_not (be_valid)
      # be_valid => meaning all of the ActiveModel::Validations passed and no errors exist.
    end

    it 'should not save without valid price' do
      @category = Category.create(name:"Tech")
      product = Product.new(
        name: 'Bose Headphone',
        price: nil,
        quantity: 10,
        category_id: @category.id
      )
      expect(product).to_not (be_valid)
      # be_valid => meaning all of the ActiveModel::Validations passed and no errors exist.
    end

    it 'should not save without valid quantity' do
      @category = Category.create(name:"Tech")
      product = Product.new(
        name: 'Bose Headphone',
        price: 2000,
        quantity: nil,
        category_id: @category.id
      )
      expect(product).to_not (be_valid)
      # be_valid => meaning all of the ActiveModel::Validations passed and no errors exist.
    end

    it 'should not save without valid quantity' do
      @category = Category.create(name:"Tech")
      product = Product.new(
        name: 'Bose Headphone',
        price: 2000,
        quantity: 25,
        category_id: nil
      )
      expect(product).to_not (be_valid)
      # be_valid => meaning all of the ActiveModel::Validations passed and no errors exist.
    end

  end
end