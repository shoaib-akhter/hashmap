# frozen_string_literal: true

require_relative 'lib/hash_map'

# Create a new HashMap instance
hash_map = HashMap.new

# Test `set` and `get`
hash_map.set('apple', 'red')
hash_map.set('banana', 'yellow')
puts hash_map.get('apple') == 'red' # Expected: true
puts hash_map.get('banana') == 'yellow' # Expected: true
puts hash_map.get('carrot').nil? # Expected: true (Key not set)

# Test `has?`
puts hash_map.has?('banana') == true  # Expected: true
puts hash_map.has?('grape') == false  # Expected: true

# Test `remove`
puts hash_map.remove('banana') == 'yellow' # Expected: true
puts hash_map.has?('banana') == false # Expected: true

# Test `length`
puts hash_map.length == 1 # Expected: true (Only 'apple' remains)

# Test `clear`
hash_map.clear
puts hash_map.empty? # Expected: true

# Test `keys`, `values`, and `entries`
hash_map.set('dog', 'brown')
hash_map.set('cat', 'black')

puts hash_map.keys.sort == %w[dog cat].sort # Expected: true
puts hash_map.values.sort == %w[brown black].sort # Expected: true
puts hash_map.entries.sort == [%w[dog brown], %w[cat black]].sort # Expected: true

# Test resizing
test_map = HashMap.new(4, 0.75) # Small capacity to trigger resizing
test_map.set('one', 1)
test_map.set('two', 2)
test_map.set('three', 3)
test_map.set('four', 4) # Should trigger resize
puts test_map.length == 4 # Expected: true

puts 'All tests passed!' if puts test_map.get('one') == 1
