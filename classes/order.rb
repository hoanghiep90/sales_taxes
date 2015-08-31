require_relative 'tax'
require_relative 'basic_tax'
require_relative 'imported_tax'
require_relative 'float'
class Order
  def initialize(basicRate, importRate)
    @total_tax = 0
    @total = 0
    @tax_sales = BasicTax.new(basicRate)
    @tax_duty = ImportedTax.new(importRate)
    @product_list = []
  end

  def add(item, count=1)
    @tax = (1.0*(@tax_sales.calculateTax(item) + @tax_duty.calculateTax(item))*count).rounding()
    @total_tax = @total_tax + @tax

    @item_with_tax = item.getPrice()*count + @tax
    @total = @total + @item_with_tax

    @string = count.to_s + "," + item.getName() + "," + ('%.2f' % @item_with_tax).to_s
    @product_list << @string
  end

  def getTotalTax()
    @total_tax
  end

  def getTotal()
    @total
  end

  def printReceipt()
    sales_taxes = "Sales Taxes: " + ('%.2f' % @total_tax).to_s
    total_order = "Total: " + ('%.2f' % @total).to_s

    @product_list << sales_taxes
    @product_list << total_order
    @product_list.join("\n")
  end
end