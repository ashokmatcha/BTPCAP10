using ProjectService as service from '../../srv/Schema';
using from '@sap/cds/common';

annotate service.ProjectSet with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Location',
                Value : Location,
            },
            {
                $Type : 'UI.DataField',
                Value : Address,
            },
            {
                $Type : 'UI.DataField',
                Value : StartDate,
            },
            {
                $Type : 'UI.DataField',
                Value : EndDate,
            },
            {
                $Type : 'UI.DataField',
                Value : Status,
            },
            {
                $Type : 'UI.DataField',
                Value : Budget,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Currency_code',
                Value : Currency_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Employee Information',
            ID : 'EmployeeInformation',
            Target : 'Employees/@UI.LineItem#EmployeeInformation',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Location',
            Value : Location,
        },
        {
            $Type : 'UI.DataField',
            Value : Address,
        },
        {
            $Type : 'UI.DataField',
            Value : StartDate,
        },
        {
            $Type : 'UI.DataField',
            Value : EndDate,
        },
        {
            $Type : 'UI.DataField',
            Value : Budget,
        },
        {
            $Type : 'UI.DataField',
            Value : Status,
        },
    ],
    UI.HeaderInfo : {
        TypeNamePlural : 'Projects',
        TypeName : '',
        Title : {
            $Type : 'UI.DataField',
            Value : Name,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : Address,
        },
        ImageUrl : Currency.symbol,
    },
);

annotate service.EmployeeSet with @(
    UI.LineItem #EmployeeInformation : [
        {
            $Type : 'UI.DataField',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Value : Department,
            Label : 'Department',
        },
        {
            $Type : 'UI.DataField',
            Value : Designation,
            Label : 'Designation',
        },
        {
            $Type : 'UI.DataField',
            Value : MobileNumber,
        },
        {
            $Type : 'UI.DataField',
            Value : Email,
            Label : 'Email',
        },
        {
            $Type : 'UI.DataField',
            Value : Location,
            Label : 'Location',
        },
        {
            $Type : 'UI.DataField',
            Value : Age,
            Label : 'Age',
        },
        {
            $Type : 'UI.DataField',
            Value : DateofBirth,
        },
        {
            $Type : 'UI.DataField',
            Value : Increment,
            Label : 'Increment',
        },
        {
            $Type : 'UI.DataField',
            Value : Salary,
            Label : 'Salary',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ProjectService.promoteEmployee',
            Label : 'promoteEmployee',
        },
    ]
);

