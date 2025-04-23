table 50103 "To-Do Item"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(2; Name; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(3; DueDate; Date) 
        {
            // Not Implemented in this example
            DataClassification = CustomerContent;
        }
        field(4; Done; Boolean)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; ID) { Clustered = true; }
    }

    trigger OnInsert()
    begin
        if ID = 0 then
            ID := IncrementInt();
    end;

    local procedure IncrementInt(): Integer
    var
        LastRec: Record "To-Do Item";
    begin
        if LastRec.FindLast() then
            exit(LastRec.ID + 1);
        exit(1);
    end;
}
