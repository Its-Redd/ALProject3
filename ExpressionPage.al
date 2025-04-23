page 50101 ExpressionPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Less Than Comparison';
    
    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(Number1; Number1)
                {
                    ApplicationArea = All;
                    Caption = 'Is Number 1';
                    ToolTip = 'Enter the first number to compare.';
                }
                field(Number2; Number2)
                {
                    ApplicationArea = All;
                    Caption = 'less than Number 2';
                    ToolTip = 'Enter the second number to compare.';
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(Run)
            {                
                ApplicationArea = All;
                Caption = 'Run';
                Image = ExecuteBatch;
                
                trigger OnAction()
                begin
                    res := Number1 < Number2;
                    if res then
                        Message('Number 1 is less than Number 2')
                    else
                        Message('Number 1 is not less than Number 2');
                end;
            }
        }
    }
    
    var
        Number1: Integer;
        Number2: Integer;
        res: Boolean;
}