require 'spec_helper'

describe Task do 

		describe "#initialize" do
		it "initializes an instance of Task with a name and a list_id" do
			test_task = Task.new({'name' => 'clean', 'list_id' => 1})
			test_task.should be_an_instance_of Task
			test_task.name.should eq 'clean'
			test_task.list_id.should eq 1
		end
	end

		describe ".all" do
		it 'starts off empty' do
			Task.all.should eq []
		end
	end

	describe ".create" do
		it "will initialize and save a new instance of Task" do
			test_task = Task.create({'name' => 'clean', 'list_id' => 1})
			Task.all.should eq [test_task]
		end
	end

	describe "#save" do
		it "saves an instance of Task to an array of all tasks" do
			test_task = Task.new({'name' => 'clean', 'list_id' => 1})
			test_task.save
			Task.all.should eq [test_task]
		end
	end

	describe "#update_name" do
		it "updates one or more attrbutes of an instance" do
			test_task = Task.create({'name' => 'clean', 'list_id' => 1})
			test_task.update_name('clean garage')
			Task.all[0].name.should eq 'clean garage'
		end
	end

	describe "#delete" do
		it "deletes the instance" do
			test_task = Task.create({'name' => 'clean', 'list_id' => 1})
			test_task.delete
			Task.all.should eq []
		end
	end

	describe "==" do
		it "is the same task if it has the same name" do
			test_task1 = Task.new({'name' => 'clean', 'list_id' => 1})
			test_task2 = Task.new({'name' => 'clean', 'list_id' => 1})
			test_task1.should eq test_task2
		end
	end
end