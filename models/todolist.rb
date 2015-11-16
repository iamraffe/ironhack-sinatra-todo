require "pry"
# require "yaml"
require "yaml/store"

class TodoList
  attr_reader :tasks

  def initialize(user, tasks = [])
  	@todo_store = YAML::Store.new "./public/tasks.yml"
  	@user = user
    @tasks = tasks
  end

  def add_task(task)
  	@tasks.push(task)
  end

  def delete_task(id)
  	@tasks.delete_if{|task| task.id == id}
  end

  def find_task_by_id(id)
  	task = @tasks.find{|task| task.id == id}
  	task.nil? ? nil : task
  end

  def sort_by_created(key = 'ASC')
  	tasks = @tasks.sort{ | task1, task2 | task1.created_at <=> task2.created_at }
  	key.upcase == 'ASC' ? tasks : tasks.reverse
  end

  def save
    @todo_store.transaction do
      @todo_store[@user] = @tasks
    end
  end

  def load_tasks
    @todo_store.transaction do
      @tasks=@todo_store[@user]
    end
  end
end
