require_relative 'tax'
class ImportedTax < Tax
  def initialize(rate)
    super(import: rate)
  end
end