page 50104 "To-Do List"
{
    Caption = 'To-Do List';
    PageType = List;
    SourceTable = "To-Do Item";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; rec.ID)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field(Done; rec.Done)
                {
                    ApplicationArea = All;
                    Editable = true;
                }
            }
        }
    }


    trigger OnOpenPage()
    var
        Rec: Record "To-Do Item";
    begin
        Rec.SetRange(Rec.Done, false);
        if Rec.FindSet() then
            Rec := Rec;
    end;
    trigger OnClosePage()
    var
        Rec: Record "To-Do Item";
    begin
        Rec.SetRange(Rec.Done, true);
        if Rec.FindSet() then
            Rec := Rec;
    end;
}
