class Queue
  attr_reader :queue

  def initialize
    @queue = Array.new
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

test_queue = Queue.new
test_queue.enqueue(1)
p test_queue.show
test_queue.enqueue(2)
p test_queue.show
test_queue.enqueue(3)
p test_queue.show
test_queue.dequeue
p test_queue.show
test_queue.dequeue
p test_queue.show
test_queue.dequeue
p test_queue.show
