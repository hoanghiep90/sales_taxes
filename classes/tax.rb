# require_relative 'basic_tax'
# require_relative 'imported_tax'
class Tax
  def initialize(rate={})
    @rate = rate
    @basic = @rate[:basic]
    @import = @rate[:import]
  end

  def calculateTax(item)
    if @rate.has_key?(:basic)
      if item.isExempt?()
        0
      else
        (item.getPrice() * @basic).round(2)
      end
    elsif @rate.has_key?(:import)
      if item.isImport?()
        (item.getPrice() * @import).round(2)
      else
        0
      end
    end
  end
end