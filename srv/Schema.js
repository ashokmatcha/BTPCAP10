const cds = require('@sap/cds')

module.exports = class ProjectService extends cds.ApplicationService { init() {

  const { ProjectSet, EmployeeSet, TimesheetSet } = cds.entities('ProjectService')

  this.before (['CREATE', 'UPDATE'], ProjectSet, async (req) => {
    debugger;
    console.log('Before CREATE/UPDATE ProjectSet', req.data)
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
  })
  this.after ('READ', TimesheetSet, async (timesheetSet, req) => {
    console.log('After READ TimesheetSet', timesheetSet)
  })


  return super.init()
}}
