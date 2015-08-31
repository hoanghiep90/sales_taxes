require_relative 'tax'
class BasicTax < Tax
  def initialize(rate)
    super(basic: rate)
  end
end