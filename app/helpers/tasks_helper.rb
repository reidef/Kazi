module TasksHelper
  def children_complete?(task)
    task.children.todo.count == 0 # returns true if all children are complete
  end
end
