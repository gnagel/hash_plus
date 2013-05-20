class Hash
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
end
