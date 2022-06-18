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
end

        
list = LinkedList.new

list.append(10)
list.size
        
        

        
