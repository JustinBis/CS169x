class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def dollars()
    return self
  end

  

  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    return self / @@currencies[singular_currency]
  end
end

class String
  def palindrome?()
    return self.downcase.gsub(/[^a-z]/, '') == self.downcase.gsub(/[^a-z]/, '').reverse
  end
end

module Enumerable
  def palindrome?()
    test1 = Array.new
    test2 = Array.new
    self.each_entry { |e| test1.push(e)}
    self.reverse_each { |e| test2.push(e)}
    return test1 == test2
  end
end

