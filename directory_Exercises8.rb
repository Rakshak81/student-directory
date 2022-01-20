def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #Array of months
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
  # get the first name
  name = gets.chomp
  puts "Please enter the cohort"
  cohort = gets.chomp
  while !(months.include?(cohort))
    puts "input valid month"
    cohort = gets.chomp
  end
  # while the name is not empty, repeat this code
  while !name.empty? do
    if cohort == ""
      cohort = "November"
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    if name.empty?
      break
    end
    cohort = gets.chomp
    while !(months.include?(cohort))
      puts "input valid month"
      cohort = gets.chomp
    end
  end
  # return the array of students
  students
end
def print_header
  puts "The students of Villian Academy"
  puts "-------------"
end
def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens till we call the methods
students = input_students    
print_header
print(students)
print_footer(students)
