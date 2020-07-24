#! /usr/bin/ruby
# frozen_string_literal: true

require './node.rb'
require './linked_list.rb'

DATA_PATH = 'data/list.csv'

# Read from file. Create if it doesn't exist yet
puts '[linkedlist] loading list from csv'

linked_list = LinkedList.new

begin
  raw_list = []

  puts '[linkedlist] list.csv found. re-building linked list to memory'

  File.foreach(DATA_PATH) { |el| raw_list << el.split(';') }

  raw_list.each { |el| linked_list.add(el[1].chomp, el[0]) }
rescue Errno::ENOENT
  puts '[linkedlist] list.csv does not exist. don\'t forget to save.'
end


raw_input = ''

while raw_input.chomp != 'x'
  puts ''
  puts 'Linked List Demo - Menu'
  puts '-----------'
  puts 'w - list elements'
  puts 'a - add element'
  puts 'd - delete element w/ uuid'
  puts 's - save list to file'
  puts 'x - exit'
  puts '-----------'

  print 'input: '
  raw_input = gets
  chomped_input = raw_input.chomp

  if chomped_input == 'w'
    linked_list.walk
    next
  end

  if chomped_input == 'a'
    print '[add] please enter string: '
    data = gets

    puts "[add] Adding '#{data.chomp} to the list"

    linked_list.add(data.chomp)
    next
  end

  if chomped_input == 'd'
    puts '[delete] Please enter uuid of element to delete'
    el_uuid = gets

    puts "[delete] Attempting to find element  w/ uuid #{el_uuid.chomp}"

    linked_list.delete(el_uuid.chomp)
    next
  end

  if chomped_input == 's'
    puts '[save] saving linked list to file. THIS WILL OVERWRITE THE ORIGINAL FILE'

    File.write(DATA_PATH, linked_list.serialize, mode: 'w')
  end
  next
end
