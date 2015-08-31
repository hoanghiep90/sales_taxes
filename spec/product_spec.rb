require 'spec_helper'
describe Product do
  it 'should create a new product' do
    @p = Product.new("music CD", 14.99, false, false)
  end
end