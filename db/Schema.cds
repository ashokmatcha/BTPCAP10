namespace BTPCAP10;
//BTPCAP10_Project//Namespace_Tablename
using { cuid,Currency } from '@sap/cds/common';

Type DataLength : String(150);
Type Address : String(200);

aspect Reusablecontent{
Location:DataLength;
}
aspect Address1{
Address:Address
}
entity Project :cuid,Reusablecontent,Address1{
//Key ID: UUID;

Name : DataLength;
StartDate : Date @title:'{i18n>StartDate}';
EndDate:Date @title : '{i18n>EndDate}';
Status:String(30) @title : '{i18n>Status}';
Budget : Decimal(15,2) @title : '{i18n>Budget}';
Currency: Currency ;
Address:Address @title : '{i18n>Address}';
Employees:Association to many Employee on Employees.Project = $self;
}
@assert.unique:
    {
Email:[Email],
MobileNumber:[MobileNumber]
    }  
entity Employee : cuid,Reusablecontent{
 //   Key EmployeeID:UUID;
 Project :Association to Project;//Association to one Project ///field_Associtaed Key field //Project_ID   "Project_ID = Project Table Key field value should be the same " PROject_ID = Project(ID)"
    Name : DataLength @mandatory @title : 'Employee Name';
    MobileNumber:Integer  @title: 'Mobile Number';
    Email:String(60) @assert.format : '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' @assert.format.message :'Kinldy Provide Correct format of email';
    Department:String(20);
    DateofBirth:Date @title : 'Date of Birth' ;
    
    Salary: Decimal(9, 2) @assert.range:[1000000.00,2000000.00];
}
entity Timesheet : cuid,Reusablecontent{
 //   Key ID: UUID;
 EmployeeName : Association to one Employee;//EmployeeName_ID
    Date:Date ;
    Hours:Integer;
    Description : String(100) @title : 'Content';
}