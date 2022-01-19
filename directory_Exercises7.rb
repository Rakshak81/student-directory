def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an emplty array
  students = []
  #get the first name
  name = gets.chomp
  puts "Please enter the cohort"
  cohort = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    if cohort == ""
      cohort = "November"
    end
  #add the student hash to array
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    cohort = gets.chomp
  end
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)