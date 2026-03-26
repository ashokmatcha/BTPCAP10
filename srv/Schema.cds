using { BTPCAP10 } from '../db/Schema';

service ProjectService  @(requires: 'authenticated-user'){
    entity ProjectSet @(restrict: [
    { grant: ['READ','UPDATE','CREATE'], to: 'ADRole' },
     { grant: ['READ'], to: 'ManagerRole' },
  ]) @odata.draft.enabled as projection on BTPCAP10.Project{
   ID, Name,StartDate,EndDate
  }; //we can achieve all CRUD operations
    entity EmployeeSet @(restrict: [
    { grant: ['READ','UPDATE','CREATE'], to: 'ADRole' },
     { grant: ['READ'], to: 'ManagerRole' },
  ]) as projection on BTPCAP10.Employee actions {
action promoteEmployee() returns EmployeeSet;

    };
    entity TimesheetSet @(restrict: [
    { grant: ['READ','UPDATE','CREATE'], to: 'ADRole' },
     { grant: ['READ'], to: 'ManagerRole' },
  ]) as projection on BTPCAP10.Timesheet{ *

  }excluding{
    Date,Hours
  };
    entity StatusSet @(restrict: [
    { grant: ['READ','UPDATE','CREATE'], to: 'ADRole' },
     { grant: ['READ'], to: 'ManagerRole' },
  ]) as projection on BTPCAP10.Status;

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