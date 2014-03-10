require './lib/task'
require './lib/list'

@list = []
@completed = []

def main_menu
  puts 'Press "n" to add a new list.'
  puts 'Press "l" to view all of your lists.'
  puts 'Press "a" to add a new task.'
  # puts 'Press "r" to remove a task.'
  puts 'Press "x" to exit.'

  main_choice = gets.chomp

  if main_choice == 'n'
    add_list
  elsif main_choice == 'a'
    add_task
  elsif main_choice == 'l'
   show_lists
  elsif main_choice == 'x'
    puts "Good-Bye!"
  elsif main_choice == 'r'
    remove_task
  else
    puts "Sorry, that wasn't a valid option."
    puts "\n"
    main_menu
  end
end

def add_list
  puts "Enter a description of the new list:"
  user_description = gets.chomp
  new_list = List.new(user_description)
  @list << new_list
  puts "List added.\n"
  puts "\n"
  main_menu
end

def show_lists
  if @list.empty?
    puts "Nothing in list.  Create a list."
  else
    puts "Here are all your lists:"
    @list.each_with_index do |list, index|
      puts "#{index + 1}. #{list.title}"    ##description is the method
    end
    select_list
  end
  puts "\n"
  main_menu
end

def select_list
  puts "Select a list to see your tasks"
  user_input = gets.chomp
  user_input = (user_input.to_i) - 1
  puts "Your Lists:"
  @list[user_input].tasks.each_with_index do |task, index|
    puts "#{index + 1}.  #{task.description}"
  end
end

def add_task
  puts "Select a list to add a task. \n"
  @list.each_with_index do |list, index|
    puts "#{index + 1}. #{list.title}"    ##description is the method
  end
  user_input = gets.chomp
  user_input = (user_input.to_i) - 1
  puts "You selected: #{@list[user_input].title}"
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  task_to_add = Task.new(user_description)
  @list[user_input].add_task(task_to_add)
  puts "Task added.\n"
  puts "\n"
  main_menu
end

def list_tasks
  if @list.empty? && @completed.empty?
    puts "Nothing in list"
  else
    puts "Here are your current tasks:"
    @list.each_with_index do |task, index|
      puts "#{index + 1}. #{task.description}"    ##description is the method
    end
    puts "Completed Tasks:"
    @completed.each_with_index do |task, index|
      puts "#{index + 1}. #{task.description}"    ##description is the method
    end
  end
  puts "\n"
  main_menu
end

def remove_task
  if @list.empty?
    puts "Nothing in list"
  else
    puts "Type the number to mark as completed"
    @list.each_with_index do |task, index|
      puts "#{index + 1}. #{task.description}"    ##description is the method
    end
    user_input = gets.chomp
    user_input = (user_input.to_i) - 1
    @completed << @list[user_input]
    @list[user_input].completed
    @list.delete_at(user_input)
    puts "Task completed"
  end
  puts "\n"
  main_menu
end


main_menu
