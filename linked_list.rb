# frozen_string_literal: true

require './node.rb'

# Linked List
class LinkedList
  def initialize
    # @type [Node]
    @head = nil
    # @type [Node]
    @tail = nil
  end

  def add(data, id = '')
    node = Node.new(data, id)

    node.next = nil
    # if it's the first addition to the list, point head and tail to the created
    # element
    if @head.nil?
      @head = node
    end

    # append created element to the end of the list
    if !@tail.nil?
      @tail.next = node
      node.prev = @tail
    end

    @tail = node
  end

  # @param [String]
  def delete(uuid)
    curr = @head

    if @head.id == uuid
      curr.next.prev = nil unless curr.next.nil?
      @head = curr.next

      return
    end

    found = false

    # perform linear search
    until curr.next.nil?
      if curr.id == uuid
        puts curr.id

        curr.prev.next = curr.next unless curr.prev.nil?

        curr.next.prev = curr.prev
        curr = nil
        found = true
        break
      end

      curr = curr.next
    end

    puts "Cannot find element with uuid #{uuid}" unless found
  end

  def walk
    if @head.nil?
      puts 'LIST IS EMPTY'
      return
    end

    curr = @head

    until curr.nil?
      puts "#{curr.id}: #{curr.data}"
      curr = curr.next
    end
  end

  def serialize
    output = []
    curr = @head

    until curr.nil?
      output << "#{curr.id};#{curr.data}"
      curr = curr.next
    end

    output.join("\n")
  end
end
