# frozen_string_literal: true
require 'securerandom'

# Represents a node in a linked list
class Node
  attr_reader :data, :prev, :next, :id
  attr_writer :data, :prev, :next

  def initialize(data, id = '')
    # @type [String]
    @id = !id.empty? ? id : SecureRandom.uuid

    # @type [Node]
    @prev = nil
    # @type [Node]
    @next = nil

    # @type [String]
    @data = data
  end
end
