class Node
    attr_accessor :next_node
    attr_reader :value
    
    def initialize (value = nil, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    attr_reader :head, :tail, :size
   
    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def begin_list(node)
        @head = node
        @tail = @head
    end
   
    def find_by_value(value, like_find)
        current = @head
        @size.times do
            return like_find ? current : true if current.value == value

            current = current.next_node
        end
        like_find ? nil : false
    end

    def append(value)
        node = Node.new(value)
        if @head.nil?
            begin_list(node)
        else
            @tail.next_node = node
            @tail = @tail.next_node
        end
        @size += 1
        node
    end

    def prepend(value)
        node = Node.new(value)
        if @head.nil?
            begin_list(node)
        else
            node.next_node = @head
            @head = node
        end
        @size += 1
        node
    end

    def size
        puts "Total nodes = #{@size}"
    end

    def head
        puts "Head node: #{@head}"
    end

    def tail
        puts "Tail node: #{@tail}"
    end

    def at(index)
        current = @head
        i = 0 
        loop do
            return current if index == i
            current = current.next_node
            throw 'index out of range' if current.nil?
            i += 1
        end
    end

    def pop
        popped = @tail
        @tail = at(@size - 2)
        @tail.next_node = nil
        @size -= 1
        popped
    end

    def contains?(value)
        find_by_value(value, false)
    end

    def find(value)
        find_by_value(value, true)
    end

    def to_s
        current = @head
        string = ''
        loop do 
            break if current.nil?

            string << "[#{current.value}] ->"
            break if current.next_node.nil?

            current = current.next_node
        end
        "#{string}nil"
    end

    def insert_at(value, index)
        return prepend(value) if index.zero?
        return append(value) if index == @size

        node = Node.new(value)
        prev_node = at(index - 1)
        node.next_node = prev_node.next_node
        prev_node.next_node = node
        node
    end

    def remove_at(index)
        return pop if index == @size - 1
        return @head = @head.next_node if index.zero?

        prev_node = at(index - 1)
        prev_node.next_node = prev_node.next_node.next_node
    end
        
end

        
list = LinkedList.new

list.append(10)
list.append(15)
list.prepend(3)
list.prepend(7)
list.append(5)

p list.to_s

list.remove_at(2)
list.insert_at(88, 1)
p list.to_s
        
        

        
