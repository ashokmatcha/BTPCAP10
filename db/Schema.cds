namespace BTPCAP10;
//BTPCAP10_Project//Namespace_Tablename
entity Project{
Key ID: UUID;
Name : String(50);
StartDate : Date;
EndDate:Date;
Status:String(30);
Budget : Decimal(15,2);
}

entity Employee{
    Key EmployeeID:UUID;
    Name : String(50);
    MobileNumber:Integer;
    Email:String(60);
    Department:String(20);
    DateofBirth:Date;
    Location:String(50);
    Salary: Decimal(9, 2);
}
entity Timesheet{
    Key ID: UUID;
    Date:Date;
    Hours:Integer;
    Description : String(100)
}