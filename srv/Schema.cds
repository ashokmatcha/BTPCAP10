using { BTPCAP10 } from '../db/Schema';

service ProjectService{
    entity ProjectSet as projection on BTPCAP10.Project;
    entity EmployeeSet as projection on BTPCAP10.Employee;
    entity TimesheetSet as projection on BTPCAP10.Timesheet;
}

//projectService/ProjectSet
//projectService/EmployeeSet