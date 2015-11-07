require_relative "../lib/task.rb"
require "spec_helper"

describe "Task" do 
 it "returns a boolean when asked if is completed" do
   expect(Task.new("This is a task").complete?).to satisfy { |x| x == true || x == false }
 end    
 # it "returns 3 just that number" do
 #   expect(StringCalculator.new.add("3")).to eq(3)
 # end
 # it "returns 25 just that number" do
 #     expect(StringCalculator.new.add("1,2; 4, 9 , 9")).to eq(25)
 # end
end