namespace BTPCAP10;
//BTPCAP10_Project//Namespace_Tablename
using { cuid,managed,temporal ,Currency } from '@sap/cds/common';


entity Project :cuid,managed,temporal{
//Key ID: UUID;
Name : String(50);
StartDate : Date;
EndDate:Date;
Status:String(30);
Budget : Decimal(15,2);
Currency: Currency ;
}
@assert.unique:
    {
Email:[Email],
MobileNumber:[MobileNumber]
    }  
entity Employee : cuid,managed,temporal{
 //   Key EmployeeID:UUID;
    Name : String(50) @mandatory;
    MobileNumber:Integer ;
    Email:String(60) @assert.format : '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' @assert.format.message :'Kinldy Provide Correct format of email';
    Department:String(20);
    DateofBirth:Date ;
    Location:String(50);
    Salary: Decimal(9, 2) @assert.range:[1000000.00,2000000.00];
}
entity Timesheet : cuid,managed,temporal{
 //   Key ID: UUID;
    Date:Date;
    Hours:Integer;
    Description : String(100)
}