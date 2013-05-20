class Hash
  # Short hand methods
  def requires(*cols); requires_fields(*cols); end
  def missing(*cols);  missing_fields(*cols);  end

  # Raise an ArgumentError if there are missing columns
  def requires_fields(*cols)
    missing = missing_fields(*cols)
    unless missing.empty?
      raise ArgumentError, "Missing value for keys=#{missing.join(',')} in opts=#{self.inspect}" 
    end
  end

  # Return the missing columns
  def missing_fields(*cols)
    cols.select { |required_key| self[required_key].nil? }
  end
end
