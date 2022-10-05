require "byebug"
class Employee
    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        @boss.employees << self unless @boss.nil?
    end

    def bonus(multiplier)
        bonus = @salary*multiplier
    end

    # def add_boss
    #     unless @boss.nil?
    #         @boss.employees << self
    #     end
    # end
end

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)

        salary_queue = employees
        all_employees = []
        until salary_queue.empty?
            # debugger
            current = salary_queue.shift
            all_employees << current
            if current.is_a?(Manager)
                current.employees.each {|employee| salary_queue << employee}
            end
        end
        e_salary_sum = all_employees.map {|employee| employee.salary}.sum
        e_salary_sum*multiplier
    end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3) 


