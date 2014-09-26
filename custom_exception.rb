class CustomException < StandardError
  attr_reader :more_info

  def initialize(*)
    @more_info = 'more info'
    super
  end

  def to_hash
    { more: 'some more info in hash' }
  end
end

class OtherCustomException < StandardError

  def initialize(*)
    @info = 'should have cause'
  end
end

def custom_method
  custom_var = { key: 'value' }
  other_method
rescue
  raise CustomException, 'with custom text'
end

def other_method
  local_var = 'some var'

  fail OtherCustomException, 'failing'
end

custom_method
