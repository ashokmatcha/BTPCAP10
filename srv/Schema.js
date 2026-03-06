const cds = require('@sap/cds')

module.exports = class ProjectService extends cds.ApplicationService { init() {

  const { ProjectSet, EmployeeSet, TimesheetSet } = cds.entities('ProjectService')

  this.before (['CREATE', 'UPDATE'], ProjectSet, async (oEvent) => {
    debugger;
    var Date1 = new Date();
   var Date1 = Date1.toISOString();
    var CurrentDate = Date1.split('T')[0];
    oEvent.data.EndDate = CurrentDate;
    // Less than Comparision means 1 variable value less than 2 nd variable value
   if(oEvent.data.EndDate < oEvent.data.StartDate){
      debugger;
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
    debugger;
  })
  this.before('DELETE',ProjectSet,async(req) =>{
debugger;
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
    console.log('After READ EmployeeSet', employeeSet)
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


  return super.init()
}}
