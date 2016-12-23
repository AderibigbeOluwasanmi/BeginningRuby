require_relative 'player'
require_relative 'room'

class Dungeon
  attr_accessor :player

  def initialize(player)
    @player = player
    @rooms = {}
  end

  def add_room(reference, name, description, connections)
    @rooms[reference] = Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms[reference]
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end


  def go(direction)
    puts 'You go' + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end

end

x = 3
player = Player.new('Fred Bloggs')
my_dungeon = Dungeon.new(player)
# Add rooms to the dungeon
my_dungeon.add_room(:large_cave,
                    'Large Cave',
                    'a large cavernous cave',
                    {:west => :small_cave})
my_dungeon.add_room(:small_cave,
                    'Small Cave',
                    'a small, claustrophobic cave',
                    {:east => :large_cave})
# Start the dungeon by placing the player in the large cave
my_dungeon.start(:large_cave)
