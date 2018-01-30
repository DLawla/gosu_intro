class JonIQTest
def initialize
  @things_jon_knows = 0
end

def perform
  10.times do |i|
    @things_jon_knows += 1 unless the_world_is_spinning?
  end
  puts "Jon knows: #{@things_jon_knows}"
end

def the_world_is_spinning?
  true
end
end

JonIQTest.new.perform