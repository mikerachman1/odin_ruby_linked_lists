class Node
  attr_accessor :pointer
  attr_reader :value
  
  def initialize(value = nil)
    @value = value
    @pointer = nil
  end
end

class LinkedList
  attr_reader :head, :tail, :size
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    node = Node.new(value)
    if @head.nil? #start list
      @head = node
      @tail = @head
    else #list contains values
      @tail.pointer = node
      @tail = node
    end
    @size += 1
    node
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil? #start list
      @head = node
      @tail = @head
    else #list contains values
      node.pointer = @head
      @head = node
    end
    @size += 1
    node
  end

  def at(index)
    return "index falls outside of list size" if index > (@size - 1)

    i = 0
    current = @head
    #loop with stopping condition
    loop do
      if i == index || current.pointer.nil?
        return current
      end
      current = current.pointer
      i += 1
    end
  end

  def pop
    popped = @tail
    current = @head
    (@size - 1).times do
      current == current.pointer
    end
    current.pointer = nil
    current = @tail
    @size -= 1
    popped
  end

  def contains?(search_value)
    current = @head
    @size.times do
      return true if current.value == search_value
      current = current.pointer
    end
    return false
  end

  def find(search_value)
    current = @head
    i = 0
    @size.times do
      return i if current.value == search_value
      current = current.pointer
      i += 1
    end
    return "not in list"
  end

  def to_s
    current = @head
    visual = ""
    @size.times do
      visual << "( #{current.value} ) -> "
      current = current.pointer
    end
    visual << "nil"
    visual
  end

  def insert_at(new_value, index)
   return "invalid index" if index > (@size - 1)
   return prepend(new_value) if index == 0 
   return append(new_value) if index == @size 

   node = Node.new(new_value)
   prev_node = at(index - 1)
   node.pointer = prev_node.pointer
   prev_node.pointer = node
   @size += 1
   node
  end

  def remove_at(index)  
    return pop if index == (@size - 1)
    return "invalid index" if index > (@size - 1)
    prev_node = at(index - 1)
    prev_node.pointer = prev_node.pointer.pointer
    @size -= 1
  end

end

list = LinkedList.new

list.append(5)
list.append(6)
list.prepend(4)
list.prepend(2)

p list.to_s
list.remove_at(1)
p list.to_s