class Product
  def initialize(name, price, excluded = false, imported = false)
    @name = name
    @price = price
    @excluded = excluded
    @imported = imported
  end

  def getName()
    @name
  end

  def getPrice()
    @price
  end

  def isExempt?()
    @excluded
  end

  def isImport?()
    @imported
  end
end