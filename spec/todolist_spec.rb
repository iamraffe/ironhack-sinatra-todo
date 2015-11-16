require_relative "../models/task.rb"
require_relative "../models/todolist.rb"
require "spec_helper"

describe "Task" do
	before :each do
		@task = Task.new("This is a task")
		@to_do_list = TodoList.new("John")
	end

	it "adds a task to the to do list upon add_task call" do
		@to_do_list.add_task(@task)
	 	expect(@to_do_list.tasks.size).to eq(1)
	end

	it "should delete an item upon delete_task call" do
		@to_do_list.add_task(@task)
		@to_do_list.delete_task(@task.id)
	 	expect(@to_do_list.tasks.size).to eq(0)
	end

	it "should return the task if it exists" do
		@to_do_list.add_task(@task)
		expect(@to_do_list.find_task_by_id(@task.id)).to eq(@task)
	end

	it "should return a sorted list by the attribute created_at upon callin sort_by_created" do
		array = []
		3.times do |i|
			array[i]=Task.new("This is a task")
			@to_do_list.add_task(array[i])
			sleep(1)
		end
		expect(@to_do_list.sort_by_created).to eq(array)
	end

	it "should return a sorted list by the attribute created_at (DESC) upon callin sort_by_created" do
		array = []
		3.times do |i|
			array[i]=Task.new("This is a task")
			@to_do_list.add_task(array[i])
			sleep(1)
		end
		expect(@to_do_list.sort_by_created('DESC')).to eq(array.reverse)
	end
end
