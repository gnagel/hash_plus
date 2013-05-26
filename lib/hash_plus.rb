class Hash
  # Backwards compatability with older versions
  def requires_fields(*_keys); requires_keys_are_not_nil(*_keys); end
  
  # Requires that the key simply be present
  # The hash can contain any value for these keys
  def requires_keys_are_present(*_keys)
    invalid_keys = _keys - self.keys
    unless invalid_keys.empty?
      raise ArgumentError, "Missing keys=#{invalid_keys.join(',')} in opts=#{self.inspect}"
    end
  end
  
  # Requires that the values for these keys be non-nil
  def requires_keys_are_not_nil(*_keys)
    invalid_keys = _keys.select { |k| self[k].nil? }
    unless invalid_keys.empty?
      raise ArgumentError, "Nil values for keys=#{invalid_keys.join(',')} in opts=#{self.inspect}"
    end
  end
  
  # Requires that the values for these keys be nil
  def requires_keys_are_nil(*_keys)
    invalid_keys = _keys.reject { |k| self[k].nil? }
    unless invalid_keys.empty?
      raise ArgumentError, "Non-Nil values for keys=#{invalid_keys.join(',')} in opts=#{self.inspect}"
    end
  end
  
  def symbolize_keys!
    keys.each do |key|
      self[(key.to_sym rescue key) || key] = delete(key)
    end
    self
  end
  
  def symbolize_array!(array)
    array.collect do |value|
      if !value.nil? && value.is_a?(Hash)
        value.symbolize_keys_recursive!
      elsif !value.nil? && value.is_a?(Array)
        symbolize_array!(value)
      end
      value
    end
    array
  end
  
  def symbolize_keys_recursive!
    symbolize_keys!
    values.each do |value|
      next if value.nil?
      if value.is_a?(Hash)
        value.symbolize_keys_recursive!
      elsif value.is_a?(Array)
        symbolize_array!(value)
      end
    end
    self
  end
end
