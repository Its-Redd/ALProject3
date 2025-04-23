page 50102 Calculator
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    
    layout
    {
        area(Content)
        {
            group(Input)
            {
                field(FirstNumber; firstNumber)
                {
                    ApplicationArea = All;
                    Caption = 'First Number';
                    ToolTip = 'Enter the first number.';
                }
                field(Operator; operator)
                {
                    ApplicationArea = All;
                    Caption = 'Operator';
                    ToolTip = 'Select the operator.';
                }


                field(SecondNumber; secondNumber)
                {
                    ApplicationArea = All;
                    Caption = 'Second Number';
                    ToolTip = 'Enter the second number.';
                }
            }

            group(Output)
            {
                field(Result; result)
                {
                    ApplicationArea = All;
                    Caption = 'Result';
                    ToolTip = 'The result of the calculation.';
                    Editable = false;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(Calculate)
            {
                ApplicationArea = All;
                Caption = 'Calculate';
                Image = Calculate;
                
                trigger OnAction()
                var
                    calcResult: Decimal;
                begin
                    case operator of
                        "Calculator Operator"::Add:
                            calcResult := firstNumber + secondNumber;
                        "Calculator Operator"::Subtract:
                            calcResult := firstNumber - secondNumber;
                        "Calculator Operator"::Multiply:
                            calcResult := firstNumber * secondNumber;
                        "Calculator Operator"::Divide:
                            if secondNumber <> 0 then
                                calcResult := firstNumber / secondNumber
                            else
                                Error('Cannot divide by zero.');
                    end;

                    result := calcResult;
                end;
            }
                
            action(Clear)
            {
                ApplicationArea = All;
                Caption = 'Clear';
                Image = ClearLog;
                
                trigger OnAction()
                begin
                    firstNumber := 0;
                    secondNumber := 0;
                    result := 0;
                    operator := "Calculator Operator"::Add; // Reset to default operator
                end;
            }
        }
    }
    
    var
        firstNumber: Decimal;
        operator: Enum "Calculator Operator";

        secondNumber: Decimal;
        result: Decimal;
}