def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an emplty array
  students = []
  #get the first name
  name = gets.chomp
  puts "Enter your hobbies"
  hobbies = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  #add the student hash to array
    students << {name: name, cohort: :november,hobbies: hobbies }
    puts "Now we have #{students.count} students"
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp
     if name == ""
       break
     end
     puts "Enter your hobbies"
     hobbies = gets.chomp
  end
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort), #{student[:hobbies]}"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)