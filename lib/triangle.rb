class Triangle
  attr_accessor :sides
  
  @sides = []
  
  def initialize (side1, side2, side3)
    @sides = [side1, side2, side3]
    @sides.sort!
  end
  
  def kind
    if @sides.any?{|side| side <= 0} || ((@sides[0] + @sides[1]) <= @sides[2])
      raise TriangleError
    elsif @sides.uniq.length == 1
      :equilateral
    elsif @sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end
  
  class TriangleError < StandardError
    
  end
end

# Alternative solution.
# class Triangle
#   attr_reader :a, :b, :c
#   def initialize(a, b, c)
#     @a = a
#     @b = b
#     @c = c
#   end

#   def kind
#     validate_triangle
#     if a == b && b == c
#       :equilateral
#     elsif a == b || b == c || a == c
#       :isosceles
#     else
#       :scalene
#     end
#   end

#   def validate_triangle
#     real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
#     [a, b, c].each do |side|
#       real_triangle << false if side <= 0 
#     raise TriangleError if real_triangle.include?(false)
#     end
#   end

#   class TriangleError < StandardError
#   end

# end