def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #Array of months
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
  # get the first name
  name = gets.chop
  puts "Please enter the cohort"
  cohort = gets.chop
  while !(months.include?(cohort))
    puts "input valid month"
    cohort = gets.chop
  end
  # while the name is not empty, repeat this code
  while !name.empty? do
    if cohort == ""
      cohort = "November"
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort}
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
     puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.chop
    if name.empty?
      break
    end
    cohort = gets.chom
    while !(months.include?(cohort))
      puts "input valid month"
      cohort = gets.chop
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
  # Sorted student data by cohort
  students_by_cohort = {}
  students.each do |student|
    cohort = student[:cohort]
    name = student[:name]
    if students_by_cohort[cohort] == nil
      students_by_cohort[cohort] = [name]
    else
      students_by_cohort[cohort].push(name)
    end
  end
  # students_by_cohort.each_value {|value,key|  puts key+value}
  students_by_cohort.each {|key, value| puts "#{key}: #{value}"}
end
def print_footer(names)
  if names.count == 1
    puts "Overall, we have #{names.count} great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
end
#nothing happens till we call the methods
students = input_students    
print_header
print(students)
print_footer(students)







