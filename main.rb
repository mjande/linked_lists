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

  def pop
    cur = @head
    prev = @head
    until cur.next_node.nil?
      prev = cur
      cur = cur.next_node
    end
    prev.next_node = nil
    @tail = prev
    cur 
  end

  def contains?(value)
    temp = @head
    until temp.nil?
      if temp.value == value
        return true
      else
        temp = temp.next_node
      end
    end
    false
  end

  def find(value)
    temp = @head 
    index = 0
    until temp.nil?
      if temp.value == value
        return index
      else
        temp = temp.next_node
        index += 1
      end
    end
  end

  def to_s
    str = ""
    temp = @head
    until temp.nil?
      str = str + "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    str = str + 'nil'
    str
  end

  def insert_at(value, index)
    cur = @head
    prev= @head
    pointer = 0
    new_node = Node.new(value)
    until cur.next_node.nil? 
      if pointer == index
        new_node.next_node = cur
        if index == 0
          @head = new_node
        else
          prev.next_node = new_node
        end 
        return new_node
      else
        prev = cur
        cur = cur.next_node
        pointer += 1
      end
    end
  end

  def remove_at(index)
    if index == 0
      @head = @head.next_node
      return @head
    else
      cur = @head 
      prev = @head
      pointer = 0
      until cur.nil?
        if pointer == index
          prev.next_node = cur.next_node
          return cur
        else
          prev = cur
          cur = cur.next_node
          pointer += 1
        end
      end
    end
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

puts list.remove_at(7)
puts list
