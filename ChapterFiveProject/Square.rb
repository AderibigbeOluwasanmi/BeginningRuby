require_relative 'Shape'

module Shapes
  class Square < Shape

    @@number_of_shapes = 0
    Test = 2
    # @param [Fixnum] side_length
    def initialize(side_length)
      @side_length = side_length
      @@number_of_shapes += 1
    end

    # @return [Fixnum] area of square.
    def calculate_area
      @side_length * @side_length
    end

    def self.count
      @@number_of_shapes
    end

  end

  class Rectangle < Shape
    def initialize (length, breadth)
      @length = length
      @breadth = breadth

    end

    def calculate_area
      @length * @breadth
    end
  end

  square1 = Square.new(5)
  puts square1.calculate_area


  square2 = Square.new(5)
  puts square2.calculate_area


  square4 = Square.new(5)
  puts square4.calculate_area

  square3 = Square.new(5)
  puts square3.calculate_area

  puts Square.count

  rec1 = Rectangle.new(2, 3)
  rec2 = Rectangle.new(4, 5)

  animals = [square1, square2, square3, square4, rec1, rec2]

  animals.each do |animal|
    puts animal.calculate_area

  end
end

class Testtheory
  attr_accessor :name

end

tt = Testtheory.new
tt.name = 'sanmi'
puts tt.name
puts tt.instance_variables
