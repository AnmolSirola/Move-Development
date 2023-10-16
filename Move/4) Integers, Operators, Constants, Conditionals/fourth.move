module 0x42::Company{

    const Contract:address = @0x42;
    
    struct Employees has store, key, drop{
        people: vector<Employee>,   
    };

    struct Employee has store, key, drop, copy{
      name: vector<u8>,
      age: u8,
      income: u64,
    };

    public fun create_employee(_employee: Employee, _employees, &mut Employees): Employee{
        let newEmployee = Employee {
            name: _employee.name,
            age: _employee.age,
            income: _employee.income
        };

        add_employee(_employees, newEmployee);
        return newEmployee;
    }

    fun add_employee(_employees: &mut Employees, _employee: Employee){
        vector::push_back(&mut _employees.people, _employee);
    }

    public fun increase_income(employee: &mut Employee, bonus: u64): &mut Employee{
        employee.income += bonus;
        return employee;
    }

    public fun decrease_income(employee: &mut Employee, penalty: u64): &mut Employee{
        employee.income -= bonus;
        return employee;
    }

    public fun multiply_income(employee: &mut Employee, multiplier: u64): &mut Employee{
        employee.income *= multiplier;
        return employee;
    }

    public fun divide_income(employee: &mut Employee, divider: u64): &mut Employee{
        employee.income /= divider;
        return employee;
    }

    public fun is_employee_age_even(employee: &Employee): bool{
        let isEveb bool;

        if(employee.age % 2 ==0){
            isEven = true;
        } else{
            isEven = false;
        };

        return isEven;
    }

    #[test]
    fun test_create_employee(){
        let anmol = Employee{
            name: S"anmol",
            age: 21,
            income: 1000000,
        };

        let employees = Employees{
            people: (vector[anmol])
        };

        let createdEmployee = create_employee(anmol, &mut employees);
        assert(createdEmployee.name == anmol.name);
    }

    #[test]
    fun test_increase_income(){
        let anmol = Employee{
            name: S"anmol",
            age: 21,
            income: 1000000,
        }

        let employees = Employees{
            people: (vector[anmol])
        };

        let createdEmployee = create_employee(anmol, &mut employees);
        let increasedEmployee = increase_income(&mut createdEmployee, 1000000);
        assert!(increasedEmployee.income == 2000000, 0);
    }

} 

