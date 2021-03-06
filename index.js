const inquirer = require('inquirer');
const mysql = require('mysql');
const cTable = require('console.table');

const connection = mysql.createConnection({
  host: 'localhost',

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: 'root',

  // Be sure to update with your own MySQL password!
  password: 'password',
  database: 'tracker_db',
});

connection.connect((err) => {
  if (err) throw err;
  runSearch();
});

const runSearch = () => {
  inquirer
    .prompt({
      name: 'action',
      type: 'rawlist',
      message: 'What would you like to do?',
      choices: [
        'View all employees',
        'View all roles',
        'View all departments',
        'Add employee',
        'Add department',
        'Add role',
        'Delete employee',
        'Update employee role',
        'Exit'
      ],
    })
    .then((answer) => {
      switch (answer.action) {
        case 'View all employees':
          viewEmployee();
          break;

        case 'View all roles':
          viewRole();
          break;

        case 'View all departments':
          viewDepartments();
          break;

        case 'Add employee':
          addEmployee();
          break;

        case 'Add department':
          addDepartment();
          break;

        case 'Add role':
          addRole();
          break;

        case 'Delete employee':
          deleteEmployee();
          break;

        case 'Update employee role':
          updateEmployeeRole();
          break;

        case 'exit':
          exit();
          break;

      }
    });
};

//function to render all employees
const viewEmployee = () => {
  const query = 'SELECT * FROM employees';
  connection.query(query, (err, res) => {
    console.table(res);
    runSearch();
  })
};
//function to render all roles
const viewRole = () => {
  const query = 'SELECT * FROM roles';
  connection.query(query, (err, res) => {
    console.table(res);
    runSearch();
  })
};
//function to render all departments
const viewDepartments = () => {
  const query = 'SELECT * FROM departments';
  connection.query(query, (err, res) => {
    console.table(res);
    runSearch();
  })
};

const addEmployee = () => {
  inquirer
  .prompt ([
    {
      name: 'first_name',
      type: 'input',
      message: 'What is the employees first name?'
    },
    {
      name: 'last_name',
      type: 'input',
      message: 'What is the employees last name?'
    },
    {
      name: 'manager',
      type: 'input',
      message: 'Who is the employees manager?'
    }
  ])
  .then((answer) => {
    const query = 'INSERT INTO employees SET ?';
    connection.query(query, 
      {
        first_name: answer.first_name,
        last_name: answer.last_name,
        manager: answer.manager
      },
        (err, res) => {
        if (err) throw err;
      console.log('employee added!');
      runSearch();
    })
  })
};
//function to add department
const addDepartment = () => {
  inquirer
  .prompt ([
    {
      name: 'department',
      type: 'input',
      message: 'What department you want to add?'
    }
  ])
  .then((answer) => {
    const query = 'INSERT INTO departments SET ?';
    connection.query(query, 
      {
        departments: answer.department
      },
        (err, res) => {
        if (err) throw err;
      console.log('department added!');
      runSearch();
    })
  })
};
//function to add a role to database
const addRole = () => {
  inquirer
  .prompt ([
    {
      name: 'role',
      type: 'input',
      message: 'What role you want to add?'
    },
    {
      name: 'salary',
      type: 'input',
      message: 'What is the salary?'
    }
  ])
  .then((answer) => {
    const query = 'INSERT INTO roles SET ?';
    connection.query(query, 
      {
        title: answer.role,
        salary: answer.salary
      },
        (err, res) => {
        if (err) throw err;
      console.log('role added!');
      runSearch();
    })
  })
};

const deleteEmployee = () => {
  inquirer
  .prompt ([
    {
      name: 'employee',
      type: 'input',
      message: 'Which employee would you like to delete (enter employee ID)?'
    },
  ])
  .then((answer) => {
    const query = 'DELETE FROM employees WHERE ?';
    connection.query(query, 
      {
        employee_id: answer.employee
      },
      (err, res) => {
        if (err) throw err;
      console.log('employee deleted!');
      runSearch();
      })
  })
};


const updateEmployeeRole = () => {
  inquirer
  .prompt ([
    {
      name: 'employee',
      type: 'input',
      message: 'Which employee would you like to update (enter employee_ID)?'
    },
    {
      name: 'role',
      type: 'input',
      message: 'Which role would you like to give them? (enter role_id)'
    }
  ])
  .then((answer) => {
    const query = 'UPDATE employees SET ? WHERE ?';
    connection.query(query, 
      [{
        role_id: answer.role
      },
      {
        employee_id: answer.employee
      }],
      (err, res) => {
        if (err) throw err;
      console.log('employee role updated!');
      runSearch();
      })
  })
};

const exit = () => {
  connection.end();
}

