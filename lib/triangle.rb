require 'pry'

class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    sides = [@side1, @side2, @side3]
    sides.each do |given_side|
      if given_side <= 0
        begin
          raise TriangleError
        end
      end
    end
    if @side1 + @side2 <= @side3 || @side2 + @side3 <= @side1 ||
         @side1 + @side3 <= @side2
      begin
        raise TriangleError
      end
    end
    sidestally = sides.tally
    if sidestally.values.length === 1
      :equilateral
    elsif sidestally.values.length === 2
      :isosceles
    elsif sidestally.values.length === 3
      :scalene
    end
  end

  class TriangleError < StandardError
    def too_small
      'This triangle has no size!'
    end
  end
end
