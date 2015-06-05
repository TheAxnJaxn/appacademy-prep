class Student
  
  attr_reader :first_name, :last_name, :course_list
  
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @course_list = []
  end
  
  def name
    full_name = first_name + " " + last_name
    return full_name
  end
  
  def enroll(course)
    
    if self.course_list.include?(course)
      raise "Student is already enrolled in that class"
    else
      self.course_list << course
    end
  
  end
  
  def course_load
    
    course_hash = {}
    
    self.course_list.each do |course|
      course_hash[course.department] = course.num_of_credits
    end
    
    return course_hash
    
  end
  
end

class Course
  
  attr_accessor :course_name, :department, :num_of_credits, :enrolled_students
  attr_reader :days, :time_block
  
  def initialize(course_name, department, num_of_credits, days, time_block)
    @course_name = course_name
    @department = department
    @num_of_credits = num_of_credits
    @enrolled_students = []
    @days = days
    @time_block = time_block
  end
  
  def students
    return enrolled_students
  end
  
  def add_student(student)
    student.enroll(self)
  end
  
  def conflicts_with?(course2)
    
    if self.time_block != course.time_block
      return false
    end
    
    self.days.each do |day|
      if course2.days.include?(day)
        return true
      end
    end
    
  end
  
end
