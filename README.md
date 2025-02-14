# HashMap Implementation

## Description

This is a custom implementation of a HashMap (hash table) in Ruby. The HashMap allows key-value pair storage, retrieval, and deletion while handling collisions and dynamic resizing when needed.

## Features

- Supports `set`, `get`, `has?`, `remove`, `clear`, and `length` methods.
- Implements dynamic resizing when the load factor is exceeded.
- Uses chaining (array of arrays) to handle hash collisions.
- Provides utility methods like `keys`, `values`, and `entries`.

## Installation

1. Clone this repository:

   ```sh
   git clone https://github.com/yourusername/hashmap.git
   ```

2. Navigate to the project directory:

   ```sh
   cd hashmap
   ```

3. Run tests using:

   ```sh
   ruby test_hash_map.rb
   ```

## Usage

You can use the `HashMap` class in your Ruby projects:

```ruby
require_relative 'lib/hash_map'

hash_map = HashMap.new
hash_map.set('apple', 'red')
hash_map.set('banana', 'yellow')
puts hash_map.get('apple') # Output: red
puts hash_map.has?('banana') # Output: true
hash_map.remove('banana')
puts hash_map.has?('banana') # Output: false
```

## Running Tests

This project includes a test suite to verify HashMap functionality. Run tests using:

```sh
ruby test_hash_map.rb
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Acknowledgments

This project was developed as part of *The Odin Project* curriculum.
