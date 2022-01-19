def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an emplty array
  students = []
  #get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  #add the student hash to array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end
def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(names)
  names.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(20)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(20)
end

students = input_students
print_header
print(students)
print_footer(students)