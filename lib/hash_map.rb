# frozen_string_literal: true

# HashMap is a custom implementation of a hash table (dictionary) in Ruby.
# It allows storing key-value pairs, retrieving values by key, checking for key existence,
# removing entries, resizing dynamically, and handling collisions using chaining (arrays within buckets).
class HashMap
  def initialize(capacity = 16, load_factor = 0.75)
    @capacity = capacity
    @load_factor = load_factor
    @size = 0
    @buckets = Array.new(@capacity) { [] } # Each bucket is an array (to handle collisions)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31 # To help distribute hash codes more evenly

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % @capacity # Ensure the index is within bounds
  end

  def set(key, value)
    index = hash(key)
    bucket = @buckets[index]

    existing_pair = bucket.find { |pair| pair[0] == key }
    existing_pair ? existing_pair[1] = value : bucket << [key, value]

    @size += 1 if existing_pair.nil?
    resize if @size.to_f / @capacity > @load_factor
  end

  def get(key)
    index = hash(key) # Get bucket index
    bucket = @buckets[index]

    # Search for the key in the bucket
    bucket.each do |pair|
      return pair[1] if pair[0] == key
    end

    nil # Return nil if key not found
  end

  def has?(key)
    index = hash(key) # Get the bucket index
    bucket = @buckets[index]

    # Check if key exists in the bucket
    bucket.each do |pair|
      return true if pair[0] == key
    end

    false # Return false if key not found
  end

  def remove(key)
    index = hash(key) # Get the bucket index
    bucket = @buckets[index]

    # Find and delete the key-value pair
    bucket.each_with_index do |pair, i|
      if pair[0] == key
        @size -= 1
        return bucket.delete_at(i)[1] # Remove the pair and return the value
      end
    end

    nil # Return nil if key not found
  end

  def length
    @size
  end

  def clear
    @buckets = Array.new(@capacity) { [] } # Reset buckets
    @size = 0 # Reset size counter
  end

  def keys
    @buckets.flatten(1).map { |pair| pair[0] }
  end

  def values
    @buckets.flatten(1).map { |pair| pair[1] }
  end

  def entries
    @buckets.flatten(1) # Returns all key-value pairs as an array
  end

  def empty?
    @size.zero?
  end  

  def resize
    new_capacity = @capacity * 2 # Double the capacity
    new_buckets = Array.new(new_capacity) { [] } # Create new buckets

    # Rehash all existing key-value pairs
    @buckets.flatten(1).each do |key, value|
      new_index = hash_rehash(key, new_capacity) # Compute new index
      new_buckets[new_index] << [key, value]
    end

    # Update instance variables
    @capacity = new_capacity
    @buckets = new_buckets
  end

  private

  def hash_rehash(key, new_capacity)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % new_capacity # Ensure the index is within bounds
  end
end
