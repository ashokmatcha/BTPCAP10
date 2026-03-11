using { BTPCAP10 } from '../db/Schema';

service ProjectService{
    entity ProjectSet as projection on BTPCAP10.Project; //we can achieve all CRUD operations
    entity EmployeeSet as projection on BTPCAP10.Employee;
    entity TimesheetSet as projection on BTPCAP10.Timesheet;

    function getTotalProjectHours() returns Integer;
    function getEmployeeDOB(ID:UUID) returns Date;
}

//projectService/ProjectSet
//projectService/EmployeeSet