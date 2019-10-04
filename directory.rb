def user_menu
  @students = []
  loop do
    display_menu
    user_action(gets.chomp)
  end
end

def display_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the student directory to csv"
  puts "4. Load the student directory from csv"
  puts "9. Exit"
end

def display_students_list
  display_header
  display_students(@students)
  display_footer(@students)
end

def user_action(option)
  case option
  when "1"
    @students = input_students
  when "2"
    display_students_list
  when "3"
    save_students_list
  when "4"
    load_students_list
  when "9"
    puts "You are leaving the AllSpark Academy System, have a nice day!"
    exit
  else
    puts "Invalid input, please try again using the options provided!"
  end
end

def input_students
  print "Instructions:\n\nPlease enter the student names.\n\nThen to finish, just hit return twice!\n\n"

  @students = []

  def student_data
    months = [
      :January,
      :February,
      :March,
      :April,
      :May,
      :June,
      :July,
      :August,
      :September,
      :October,
      :November,
      :December,
    ]

    print "Enter the first name:\n"
    first_name = gets.delete "\r\n"

    while !first_name.empty?
      print "Enter #{first_name}'s last name:\n"
      last_name = gets.delete "\r\n"
      until !last_name.empty?
        print "You need to enter #{first_name}'s last name!\n"
        last_name = gets.delete "\r\n"
      end
      print "Enter #{first_name}'s date of birth:\n"
      date_of_birth = gets.delete "\r\n"
      until !date_of_birth.empty?
        print "You need to enter #{first_name}'s date of birth!\n"
        date_of_birth = gets.delete "\r\n"
      end
      print "Enter #{first_name}'s country of birth:\n"
      country_of_birth = gets.delete "\r\n"
      until !country_of_birth.empty?
        print "You need to enter #{first_name}'s country of birth!\n"
        country_of_birth = gets.delete "\r\n"
      end
      print "Enter #{first_name}'s height:\n"
      height = gets.delete "\r\n"
      until !height.empty?
        print "You need to enter #{first_name}'s height!\n"
        height = gets.delete "\r\n"
      end
      print "Enter #{first_name}'s cohort\n"
      cohort = gets.chomp.capitalize.to_sym
      if cohort.empty?
        cohort = :November
      end
      while !months.include?(cohort)
        print "Invalid entry. Enter #{first_name}'s cohort or hit enter to use default\n"
        cohort = gets.chomp.capitalize.to_sym
        if cohort.empty?
          cohort = :November
        end
      end
      print "Enter #{first_name}'s hobbies:\n"
      hobbylist = gets.delete "\r\n"
      hobbies = []
      hobbies << hobbylist.split { " " }
      until !hobbies.empty?
        print "You need to enter #{first_name}'s hobbies!\n"
        hobbylist = gets.delete "\r\n"
      end

      @students << {
        first_name: first_name,
        last_name: last_name,
        date_of_birth: date_of_birth,
        country_of_birth: country_of_birth,
        height: height,
        cohort: cohort,
        hobbies: hobbies,
      }

      if @students.length > 1
        print "Now we have #{@students.length} students\n"
      else
        print "Now we have #{@students.length} student\n"
      end

      print "Next student! Enter the first name:\n"
      first_name = gets.delete "\r\n"
    end
  end

  student_data

  @students
end

def save_students_list
  file = File.open("AllSpark_Students.csv", "w")
  @students.each do |student|
    student_data = [
      student[:first_name],
      student[:last_name],
      student[:date_of_birth],
      student[:country_of_birth],
      student[:height],
      student[:cohort],
      student[:hobbies],
    ]
    csv_line = student_data.join(" , ")
    file.puts csv_line
  end
  file.close
end

def load_students_list
  file = File.open("AllSpark_Students.csv", "r")
  file.readlines.each do |line|
    first_name, last_name, date_of_birth, country_of_birth, height, cohort, hobbies = line.chomp.split(" , ")
    @students << {
      first_name: first_name,
      last_name: last_name,
      date_of_birth: date_of_birth,
      country_of_birth: country_of_birth,
      height: height,
      cohort: cohort.to_sym,
      hobbies: hobbies,
    }
  end
  file.close
end

def display_header
  print "The Students of AllSpark Academy\n-------------\n"
end

def display_students(students)
  students.each_with_index do |student, index|
    print "#{index + 1}. #{student[:first_name]} #{student[:last_name]} #{student[:country_of_birth]} #{student[:height]} (#{student[:cohort]} cohort) #{student[:hobbies]}\n"
  end
end

def display_footer(students)
  if @students.length > 1
    print "In total we have #{@students.length} students\n"
  else
    print "In total we have #{@students.length} student\n"
  end
end

user_menu
