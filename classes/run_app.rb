require 'csv'
require_relative 'product'
require_relative 'order'

class MainApp
  def self.start_app input, output
    cart = Order.new(0.1, 0.05)

    str = File.open("#{input}", "r").read
    data = CSV.parse(str, :col_sep => ", ", :converters => :numeric)
    data.shift # skip header.
    data.each do |row|
      quantity = row[0].to_i
      name = row[1].to_s.strip
      price = row[2].to_f
      exempt = (name =~ /(book|chocolate|pill)/)
      import = (name =~ /imported/)
      item = Product.new(name, price, exempt, import)
      cart.add(item, quantity)
      p cart
    end

    f = File.open("#{output}", "w")
    f.write(cart.printReceipt())
    f.close
  end
end

MainApp.start_app("input1.csv", "output1.csv")
MainApp.start_app("input2.csv", "output2.csv")
MainApp.start_app("input3.csv", "output3.csv")