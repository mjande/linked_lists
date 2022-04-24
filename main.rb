class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      temp = head 
      until temp.next_node.nil?
        temp = temp.next_node
      end
      temp.next_node = node
      @tail = node
    end
  end

  def prepend(value)
    node = Node.new(value)
    unless head.nil? 
      node.next_node = @head
    end
    @head = node
  end

  def size
    temp = @head
    size = 0
    until temp.nil?
      size += 1
      temp = temp.next_node
    end
    size
  end

  def at(index)
    temp = @head
    index.times { temp = temp.next_node }
    temp
  end

  #Working on pop right now
  def pop
    cur = @head.next_node
    prev = @head
    until temp.next_node.nil?
      temp = temp.next_node
    end

end

class Node
  attr_reader :value
  attr_accessor :next_node
  
  def initialize(value=nil)
    @value = value
    @next_node = nil
  end
end

list = LinkedList.new
list.append('element')
list.append('element2')
list.append('element3')
list.append('element4')
list.append('element5')

p list.at(3)