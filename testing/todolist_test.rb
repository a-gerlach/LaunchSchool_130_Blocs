require 'minitest/autorun'
require "minitest/reporters"
require 'simplecov'
SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

# class TodoListTest < MiniTest::Test

#   def setup
#     @todo1 = Todo.new("Buy milk")
#     @todo2 = Todo.new("Clean room")
#     @todo3 = Todo.new("Go to gym")
#     @todos = [@todo1, @todo2, @todo3]

#     @list = TodoList.new("Today's Todos")
#     @list.add(@todo1)
#     @list.add(@todo2)
#     @list.add(@todo3)
#   end

#   def test_to_a
#     assert_equal(@todos, @list.to_a)
#   end

#   def test_equal_size
#     assert_equal(3, @list.size)
#   end

#   def test_first
#     assert_equal(@todo1, @list.first)
#   end

#   def test_last
#     assert_equal(@todo3, @list.last)
#   end

#   def test_shift
#     assert_equal(@todo1, @list.shift)
#   end

#   def test_pop
#     todo = @list.pop
#     assert_equal(@todo3, todo)
#     assert_equal([@todo1, @todo2], @list.to_a)
#   end

#   def test_done_question
#     assert_equal(false, @list.done?)
#   end

#   def test_raises_Typeerror
#     assert_raises(TypeError) do
#       @list.add("Test")
#     end
#   end

#   def test_add_alias
#     new_todo = Todo.new("Walk the dog")
#     @list.add(new_todo)
#     todos = @todos << new_todo

#     assert_equal(todos, @list.to_a)
#   end

#   def test_item_at
#     assert_equal(@list.first, @list.item_at(0))
#   end

#   def test_index_error
#     assert_raises(IndexError) {@list.item_at(8)}
#   end

#   def test_mark_done_at
#     assert_equal(@list.mark_done_at(1), @todo2.done?)
#   end

#   def test_IndexError
#     assert_raises(IndexError) {@list.mark_done_at(100)}
#   end

#   def test_mark_undone_at
#     @list.mark_undone_at(1)
#     assert_equal(false, @todo2.done?)
#   end

#   def test_done!
#     @list.done!

#     assert_equal(true, @todo1.done?)
#     assert_equal(true, @todo2.done?)
#     assert_equal(true, @todo3.done?)    
#   end

#   def test_remove_at
#     assert_raises(IndexError) {@list.remove_at(100)}
#     assert_equal(3, @list.size)
#     @list.remove_at(2)
#     assert_equal(2, @list.size)
#   end

#   def test_to_s
#     output = <<-OUTPUT.chomp.gsub /^\s+/, ""
#     ---- Today's Todos ----
#     [ ] Buy milk
#     [ ] Clean room
#     [ ] Go to gym
#     OUTPUT

#     assert_equal(output, @list.to_s)
#   end

#   def test_done_to_s
#     @list.mark_done_at(1)
#     output = <<-OUTPUT.chomp.gsub /^\s+/, ""
#     ---- Today's Todos ----
#     [ ] Buy milk
#     [X] Clean room
#     [ ] Go to gym
#     OUTPUT
    
#     assert_equal(output, @list.to_s)
#   end

#   def test_all_done
#     @list.done!
#     output = <<-OUTPUT.chomp.gsub /^\s+/, ""
#     ---- Today's Todos ----
#     [X] Buy milk
#     [X] Clean room
#     [X] Go to gym
#     OUTPUT
    
#     assert_equal(output, @list.to_s)    
#   end

#   def test_each
#     result = []
#     @list.each { |todo| result << todo }
#     assert_equal([@todo1, @todo2, @todo3], result)
#   end

#   def test_another_each
#     result = @list.each {|todo| puts todo}
#     assert_equal(result, @list)
#   end



#   # Your tests go here. Remember they must start with "test_"

# end

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal("Buy milk", @todos.first.title)
  end

  def test_last
    assert_equal(@todo3,  @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todo3, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done
    @list.done!
    assert_equal(true, @list.done?)
  end


  def test_type_error
    assert_raises(TypeError) do
      @list.add(3)
    end
  end

  def test_alias
    temp_list = TodoList.new("Test_List")
    temp_list.add(@todo1)
    temp_list << @todo2
    assert_equal(2, temp_list.size)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) do
      @list.item_at(100)
    end
  end

  def test_mark_done_at
    @list.mark_done_at(1)
    assert_equal(true, @todo2.done?)
    assert_raises(IndexError) do
      @list.mark_done_at(100)
    end
  end

  def test_mark_done_at
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
    assert_raises(IndexError) do
      @list.mark_undone_at(100)
    end
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_remove_at
    @list.remove_at(0)
    assert_equal(2 , @list.size)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_v2
    @list.mark_done_at(0)
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    @list.each { |item| item.undone!}
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each_vs
    assert_equal(@list, @list.each{|item| item})
  end

  def test_select
    @list.done!
    @list.mark_undone_at(0)
    refute_equal(@list, @list.select {|item| item.done?})
  end
end