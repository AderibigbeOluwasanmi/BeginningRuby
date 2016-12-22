require_relative 'Shape'

class Square < Shape
  # @param [Fixnum] side_length
  def initialize(side_length)
    @side_length = side_length
  end

  # @return [Fixnum] area of square.
  def calculate_area
    @side_length * @side_length
  end

end

square1 = Square.new(5)
puts square1.calculate_area