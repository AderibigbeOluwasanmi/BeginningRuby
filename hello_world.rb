class HelloWorld
  def say
    puts "Hello world"
  end
end

ruby_hello_world = HelloWorld.new

rubyHelloWorld.say


rice_on_square = 1
64.times do |square|
  puts "On square #{square + 1} are #{rice_on_square} grain(s)"
  rice_on_square *= 2
end