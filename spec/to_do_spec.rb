require 'rspec'
require 'task'
require 'list'

describe Task do
  it 'should initialize the Task with a description' do
    new_task = Task.new('wash the car')
    new_task.should be_an_instance_of Task
  end

  it 'lets you read the description' do
    new_task = Task.new('wash the car')
    new_task.description.should eq 'wash the car'
  end

  it 'lets you complete a task' do
    new_task = Task.new('walk the dog')
    new_task.completed.should eq true
  end

end

describe List do
  it 'should initialize with a list title' do
    new_list = List.new('Chores')
    new_list.should be_an_instance_of List
  end

  it 'should add a task to the instance list' do
    new_list = List.new('Chores')
    new_task = Task.new('wash the car')
    new_list.add_task(new_task)
    new_list.tasks.should eq [new_task]
  end
end
