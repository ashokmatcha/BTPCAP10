const cds = require('@sap/cds');
const { SELECT } = require('@sap/cds/lib/ql/cds-ql');

module.exports = class ProjectService extends cds.ApplicationService { init() {

  const { ProjectSet, EmployeeSet, TimesheetSet } = cds.entities('ProjectService')

  this.before (['CREATE', 'UPDATE'], ProjectSet, async (oEvent) => {
    var Date1 = new Date();
   var Date1 = Date1.toISOString();
    var CurrentDate = Date1.split('T')[0];
    oEvent.data.EndDate = CurrentDate;
    // Less than Comparision means 1 variable value less than 2 nd variable value
   if(oEvent.data.EndDate < oEvent.data.StartDate){
      oEvent.error('End Date should not be less than Start Date')
    }
    // greater than Comparision means 1 variable value  greater than 2 nd variable value
   /*  if(oEvent.data.EndDate > oEvent.data.StartDate){
      debugger;
    }*/
//Both are value equal or not
    /*    if(oEvent.data.EndDate == oEvent.data.StartDate){
      debugger;
    }*/
    console.log('Before CREATE/UPDATE ProjectSet', oEvent.data)
  })
  this.before('DELETE',ProjectSet,async(req) =>{

const data =  await SELECT.one.from(ProjectSet).where({
  ID:req.data.ID
})
if(data.Status == 'GoLive'){
  req.error('You can not delete status Golive Projects')
}

  })
  
  this.after ('READ', ProjectSet, async (projectSet, req) => {
    console.log('After READ ProjectSet', projectSet)
  })
  this.before (['CREATE', 'UPDATE'], EmployeeSet, async (req) => {
    console.log('Before CREATE/UPDATE EmployeeSet', req.data)
  })
  this.after ('READ', EmployeeSet, async (employeeSet, req) => {
    console.log('After READ EmployeeSet', employeeSet);
    let DateofBirth;
    let CurrentYear;
    let BirthYear;
    for(let emp of employeeSet){
      if(emp.DateofBirth){
CurrentYear = new Date().getFullYear();
BirthYear = emp.DateofBirth.split('-')[0];
emp.Age = CurrentYear - BirthYear;

      }
      if(emp.Salary <= '1500000'){
        emp.Designation = 'Senior Consultant'
        emp.increment = '20';
      ///  emp.Increment = parseFloat(emp.Salary * 1.20);
      }else{
        emp.Designation = 'Manager'
        emp.increment = '10'
        //emp.Increment = parseFloat(emp.Salary * 1.10);
      }
    }
  })
  this.before (['CREATE', 'UPDATE'], TimesheetSet, async (req) => {
    console.log('Before CREATE/UPDATE TimesheetSet', req.data)
    if(req.data.Hours > 8){
      req.error('You can not enter more than 8 Hours')
    }
  })
  this.after ('READ', TimesheetSet, async (timesheetSet, req) => {
    console.log('After READ TimesheetSet', timesheetSet)
  })
this.on('getEmployeeDOB',async(req)=>{
 // const data = await SELECT.one.from(EmployeeSet).where({ID:req.data.ID})
  // return data.DateofBirth;
 const data = await SELECT.one.from(EmployeeSet).columns('DateofBirth').where({ID:req.data.ID});
 return data;


})

this.on('getTotalProjectHours',async(req)=>{
  const data = await SELECT.one.from(TimesheetSet).columns('Min(Hours)');
  return data
})

this.on('getTotalProjectBudget',async(req)=>{
 const data = await SELECT.one.from(ProjectSet).columns('sum(Budget)');
 return data; 
})


this.on('promoteEmployee',async(req)=>{
//We  got the data
//Validate data again Id in Employee table
const data = await SELECT.one.from(EmployeeSet).where({
  ID:req.data.ID
})
//IF Data is not there in table will through an error
if(!data){
 return req.error('data not found');
}
data.Salary = parseFloat(data.Salary * 1.30);

await UPDATE(EmployeeSet).set({
Salary : data.Salary

}).where({
  ID:req.data.ID
})
const returndata = await SELECT.one.from(EmployeeSet).where({ID:req.data.ID})
return returndata;
//if data available will give 30% Hike
//update Table 
//and return table


})

  return super.init()
}}
