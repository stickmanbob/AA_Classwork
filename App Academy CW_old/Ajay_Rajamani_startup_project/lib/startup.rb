require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name,funding,salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []

    end

    def valid_title?(title)
        return true if @salaries.include?(title)
        false
    end

    def > (other_startup)
        return true if @funding > other_startup.funding
        false
    end

    def hire(name,title)
         if valid_title?(title)
            @employees << Employee.new(name,title)
         else
            raise "Not a valid title"
         end
    end

    def size
        @employees.length
    end

    def pay_employee(worker)
        salary = @salaries[worker.title]

        if salary < @funding
            worker.pay(salary)
            @funding -= salary
        else 
            raise "Not enough funds!"
        end
    end

    def payday
        @employees.each {|worker| pay_employee(worker)}
    end

    def average_salary
        total_salaries = 0
        @employees.each {|worker| total_salaries += @salaries[worker.title]}

        return total_salaries.to_f / @employees.length

    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire (other_startup)
        @funding += other_startup.funding
        other_startup.salaries.merge!(@salaries)
        @salaries = other_startup.salaries
        @employees += other_startup.employees
        other_startup.close
    end











end
