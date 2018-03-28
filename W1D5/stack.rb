class Stack
  attr_reader :stack

   def initialize
     # create ivar to store stack here!
     @stack = Array.new
   end

   def add(el)
     # adds an element to the stack
     @stack.push(el)
   end

   def remove
     # removes one element from the stack
     @stack.pop
   end

   def show
     # return a copy of the stack
     @stack.dup
   end
end

test_stack = Stack.new
test_stack.add(1)
p test_stack.show
test_stack.add(2)
p test_stack.show
test_stack.add(3)
p test_stack.show
test_stack.remove
p test_stack.show
test_stack.remove
p test_stack.show
test_stack.remove
p test_stack.show
