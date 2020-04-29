require_relative "employee.rb"
class Manager < Employee
    attr_accessor :boss
    attr_reader :employees
    def initialize(name, title, salary, boss, employees)
        @employees = employees
        @employees.each { |employee| employee.boss = self}
        super(name, title, salary, boss)
    end

    def bonus(multiplier)
        sub_employees = @employees
        @employees.each do |employee|
            if employee.is_a?(Manager)
                sub_employees += employee.employees
            end
        end
        total_salary = 0
        sub_employees.each { |employee| total_salary += employee.salary}
        bonus = total_salary * multiplier
    end
end

shawna = Employee.new("Shawna", "TA", 12000, nil)
david = Employee.new("David", "TA", 10000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, nil, [david, shawna])
ned = Manager.new("Ned", "Founder", 1000000, nil, [darren])

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000