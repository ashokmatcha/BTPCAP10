using { BTPCAP10 } from '../db/Schema';

service ProjectService{
    entity ProjectSet @odata.draft.enabled as projection on BTPCAP10.Project; //we can achieve all CRUD operations
    entity EmployeeSet as projection on BTPCAP10.Employee actions {
action promoteEmployee() returns EmployeeSet;

    };
    entity TimesheetSet as projection on BTPCAP10.Timesheet;
    entity StatusSet as projection on BTPCAP10.Status;

    function getTotalProjectHours() returns Integer;
    function getEmployeeDOB(ID:UUID) returns Date;
    function getTotalProjectBudget() returns Decimal;
    
}

//annotate ProjectService.EmployeeSet  with actions {
    //promoteEmployee @common.SideEffects :{
      //  TargetProperties:['Salary','Incremenet','Designation']
    //}
//};

//projectService/ProjectSet
//projectService/EmployeeSet