# class Todo
#   DONE_MARKER = 'X'
#   UNDONE_MARKER = ' '

#   attr_accessor :title, :description, :done

#   def initialize(title, description='')
#     @title = title
#     @description = description
#     @done = false
#   end

#   def done!
#     self.done = true
#   end

#   def done?
#     done
#   end

#   def undone!
#     self.done = false
#   end

#   def to_s
#     "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
#   end
# end

# class TodoList
#   attr_accessor :title, :todos

#   def initialize(title)
#     @title = title
#     @todos = []
#   end

#   def add(item)
#     if item.class == Todo
#       todos << item
#     else
#       raise TypeError, 'Can only add Todo objects'
#     end
#   end

#   def size
#     puts "The size of the array is #{todos.size}"
#   end

#   def first
#     puts "The first element of the array is:\n#{todos.first}"
#   end

#   def last
#     puts "The last element of the array is:\n#{todos.last}"
#   end

#   def item_at(index)
#     if index > todos.size
#       raise IndexError, "You have entere an invalid index"
#     else
#       puts "This the item at index #{index}:\n#{todos[index]}" 
#     end    
#   end

#   def mark_done_at(index)
#     todos[index].done!
#   end

#   def mark_undone_at(index)
#     todos[index].undone!
#   end

#   def shift
#     todos.shift
#   end

#   def pop
#     todos.pop
#   end

#   def remove_at(index)
#     todos.delete_at(index)
#   end

#   def to_s
#     puts "---- Today's Todos ----"
#     todos.each do |ele|
#       puts ele
#     end
#   end

# end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# list = TodoList.new("Today's Todos")

# list.add(todo1) 
# list.add(todo2)
# list.add(todo3)
# #list.add(1) 
# list.size
# list.first
# list.last
# list.item_at(2) 

# list.mark_done_at(1)
# list.item_at(1) 

# list.mark_undone_at(1) 
# list.to_s


# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

# class Todo
#   DONE_MARKER = 'X'
#   UNDONE_MARKER = ' '

#   attr_accessor :title, :description, :done

#   def initialize(title, description='')
#     @title = title
#     @description = description
#     @done = false
#   end

#   def done!
#     self.done = true
#   end

#   def done?
#     done
#   end

#   def undone!
#     self.done = false
#   end

#   def to_s
#     "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
#   end
# end

# # This class represents a collection of Todo objects.
# # You can perform typical collection-oriented actions
# # on a TodoList object, including iteration and selection.

# class TodoList
#   attr_accessor :title

#   def initialize(title)
#     @title = title
#     @todos = []
#   end

#   def size
#     @todos.size
#   end

#   def first
#     @todos.first
#   end

#   def last
#     @todos.last
#   end

#   def shift
#     @todos.shift
#   end

#   def pop
#     @todos.pop
#   end

#   def done?
#     @todos.all? { |todo| todo.done? }
#   end

#   def <<(todo)
#     raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

#     @todos << todo
#   end
#   alias_method :add, :<<

#   def item_at(idx)
#     @todos.fetch(idx)
#   end

#   def mark_done_at(idx)
#     item_at(idx).done!
#   end

#   def mark_undone_at(idx)
#     item_at(idx).undone!
#   end

#   def done!
#     @todos.each_index do |idx|
#       mark_done_at(idx)
#     end
#   end

#   def remove_at(idx)
#     @todos.delete(item_at(idx))
#   end

#   def to_s
#     text = "---- #{title} ----\n"
#     text << @todos.map(&:to_s).join("\n")
#     text
#   end

#   def to_a
#     @todos
#   end

#   def each # official solution for the each method
#     @todos.each do |todo|
#       yield(todo)
#     end
#   end

#   # def select
#   #   result = []
#   #   each do |todo|
#   #     result << todo if yield(todo)
#   #   end
#   # result = TodoList.new("title")
#   # #result
#   # end

#   def find_by_title(string)
#     results = []
#     each do |todo|
#       results << todo if todo.title.include?(string)
#     end
#     results
#   end

#   def mark_done(string)
#     results = []
#     each do |todo|
#       if todo.title.include?(string)
#         todo.done!
#         results << todo
#       end
#       #results << todo if todo.title.include?(string).done!
#     end
#     results
#   end

#   def all_done(title)
#     list = TodoList.new(title)
#     each do |todo|
#       list.add(todo) if yield(todo)
#     end
#     list
#   end

#   def mark_all_done
#     results = []
#     each do |todo|
#       todo.done!
#       results << todo
#     end
#     results
#   end

#   def mark_all_undone
#     results = []
#     each do |todo|
#       todo.undone!
#       results << todo
#     end
#     results    
#   end

#   def all_not_done(title)
#     list = TodoList.new(title)
#     each do |todo|
#       list.add(todo) if yield(todo)
#     end
#     list    
#   end

#   def select # official solution for select and returning a new object
#     list = TodoList.new(title)
#     each do |todo|
#       list.add(todo) if yield(todo)
#     end
#     list
#   end
# end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

# #todo1.done!
# #todo2.done!

# #p list.find_by_title("gym")

# #p list.all_done("Done Items") {|todo| todo.done?}

# #p list.mark_done("room")

# #p list.mark_all_done

# p list.mark_all_undone

# #p list.all_not_done("Not done Items") {|todo| !todo.done?}

# # results = list.select { |todo| todo.done? }    # you need to implement this method

# # puts results.inspect

# # todo1 = Todo.new("Buy milk")
# # todo2 = Todo.new("Clean room")
# # todo3 = Todo.new("Go to gym")

# # list = TodoList.new("Today's Todos")
# # list.add(todo1)
# # list.add(todo2)
# # list.add(todo3)


# # list.each do |todo|
# #   puts todo                   # calls Todo#to_s
# # end

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    @todos << todo
  end
  alias_method :add, :<<

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def remove_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  # returns first Todo by title, or nil if no match
  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end
end