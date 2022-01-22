@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students\n2. Show the students "
  puts "3. Save the list to students.csv\n4. load students"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  while !name.empty? do # while the name is not empty, repeat this code
    add_students(name)# add the student hash to the array
    puts "Now we have #{@students.count} students" # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy\n -------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "Enter File to be Saved"
  file_name = gets.chomp
  file = File.open("#{file_name}", "w") do |file|
  @students.each do |student|# iterate over the array of students
  student_data = [student[:name], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
  end
  #file.close
  puts "File saved"
  end
end

def load_students
  puts "Enter the file to be loaded"
  file_name = gets.chomp
  file = File.open("#{file_name}", "r") do |file|
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  add_students(name)
  end
  #file.close
  puts "File loaded"
  end
end

def add_students(name)
  @students << {name: name, cohort: :november}
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
