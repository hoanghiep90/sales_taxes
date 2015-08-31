require_relative '../classes/float'
require_relative '../classes/product'
require_relative '../classes/tax'
require_relative '../classes/imported_tax'
require_relative '../classes/basic_tax'
require_relative '../classes/order'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end