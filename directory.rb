def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty?
    # add the student hash to the array
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def printuntil(students)
  index = 0
  until index >= students.length
    puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students

#nothing happens until we call the methods
print_header
printuntil(students)
print_footer(students)
