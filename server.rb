require 'sinatra'
require 'sinatra/reloader'
require "pry"
# We're going to need to require our class files
require_relative('./models/task.rb')
require_relative('./models/todolist.rb')



todo_list = TodoList.new("Josh")
# todo_list.save

todo_list.load_tasks

get "/" do
  redirect('/task')
end

get '/task' do
  @tasks = todo_list.tasks
  erb :"tasks/index", layout: :app
end

get '/task/create' do
  erb :"tasks/create", layout: :app
end

post '/task' do
  task = Task.new(params[:content])
  todo_list.add_task(task)
  todo_list.save
  redirect('/task')
end

put '/task/:id' do
  task = todo_list.find_task_by_id(params[:id])
  task.complete!
end

delete '/task/:id' do
  todo_list.delete_task(params[:id])
end
