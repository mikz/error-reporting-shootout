class CustomException < StandardError
  attr_reader :more_info

  def initialize(*)
    @more_info = 'more info'
    super
  end
end
