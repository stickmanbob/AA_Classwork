class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
        node.prev.next = node.next 
        node.next.prev = node.prev 
  end

  def inspect
    "#{self.key}: #{self.val}"
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail 
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def last
    return nil if empty?
    @tail.prev 
  end

  def first 
    return nil if empty?
    @head.next 
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def include?(key)
    self.any? {|node| node.key == key}
  end

  def append(key, val)
    new_node = Node.new(key,val)
    new_node.prev = @tail.prev
    @tail.prev.next = new_node 
    @tail.prev = new_node
    new_node.next = @tail 

    @head.next = new_node if @head.next == @tail 
    new_node 
  end

  def update(key, val)
    self.each do |node|
      if node.key == key 
        node.val = val 
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key 
        node.prev.next = node.next 
        node.next.prev = node.prev 
      end
    end
  end

  def each(&prc)
    current_node = @head.next 
    until current_node == @tail 
      prc.call(current_node)
      current_node = current_node.next 
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
