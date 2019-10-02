def input_students
  print "Instructions:\n\nPlease enter the student names.\n\nThen to finish, just hit return twice!\n\n"

  students = []

  puts "Enter the first name:"
  first_name = gets.chomp

  while !first_name.empty?
    puts "Enter the last name:"
    last_name = gets.chomp
    until !last_name.empty?
      puts "You need to enter a last name!"
      last_name = gets.chomp
    end
    puts "Enter the date of birth:"
    date_of_birth = gets.chomp
    until !date_of_birth.empty?
      puts "You need to enter a date of birth!"
      date_of_birth = gets.chomp
    end
    puts "Enter the country of birth:"
    country_of_birth = gets.chomp
    until !country_of_birth.empty?
      puts "You need to enter a country of birth!"
      country_of_birth = gets.chomp
    end
    puts "Enter the height:"
    height = gets.chomp
    until !height.empty?
      puts "You need to enter a height!"
      height = gets.chomp
    end
    puts "Enter the cohort:"
    cohort = gets.chomp
    until !cohort.empty?
      puts "You need to enter a cohort!"
      cohort = gets.chomp
    end
    puts "Enter the hobbies:"
    hobbies = gets.chomp
    until !hobbies.empty?
      puts "You need to enter a hobby!"
      hobbies = gets.chomp
    end

    students << {
      first_name: first_name,
      last_name: last_name,
      date_of_birth: date_of_birth,
      country_of_birth: country_of_birth,
      height: height,
      cohort: cohort,
      hobbies: hobbies,
    }

    puts "Now we have #{students.length} students"

    puts "Next student! Enter the first name:"
    first_name = gets.chomp
  end

  students
end

def display_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def display(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:first_name]} #{student[:last_name]} #{student[:country_of_birth]} #{student[:height]} (#{student[:cohort]} cohort) #{student[:hobbies]}"
  end
end

def display_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students

#nothing happens until we call the methods
display_header
display(students)
display_footer(students)
