require_relative "../lib/task.rb"
require "spec_helper"

describe "Task" do 
	before :each do
		@task = Task.new("This is a task")
	end	
	it "returns a boolean when asked if is completed" do
	 	expect(@task.complete?).to satisfy { |x| x == true || x == false }
	end  
	  
	it "should return true after a 'complete!' method call" do
	 	expect(@task.complete!).to eq(true)
	end

	it "should return false after a 'make_incomplete!' method call" do
		@task.complete!
	 	expect(@task.make_incomplete!).to eq(false)
	end 

	it "should update the task content after an 'update_content!' method call" do
	 	expect(@task.update_content!("This is not a task")).to eq("This is not a task")
	end 

	it "should update the task updated_at after an 'update_content!' method call" do
		@task.update_content!("This is not a task")
	 	expect(@task.updated_at).to be_within(0.001).of Time.now
	end 	
end