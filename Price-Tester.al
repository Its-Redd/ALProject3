page 50105 "Price Tester"
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
                field(Price; price)
                {
                    ApplicationArea = All;
                    Caption = 'Price';
                    ToolTip = 'Enter the price of the item.';
                }
                field(Tax; tax)
                {
                    ApplicationArea = All;
                    Caption = 'Tax Percentage';
                    ToolTip = 'Enter the tax percentage.';
                }
                field(ShippingCost; shippingCost)
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Cost';
                    ToolTip = 'Enter the shipping cost.';
                }
                field(ShippingPrice; shippingPrice)
                {
                    ApplicationArea = All;
                    Caption = 'Shipping Price';
                    ToolTip = 'Enter the shipping price.';
                }
                field(Discount; discount)
                {
                    ApplicationArea = All;
                    Caption = 'Discount Percentage';
                    ToolTip = 'Enter the discount percentage.';
                }
                field(ProductionCost; productionCost)
                {
                    ApplicationArea = All;
                    Caption = 'Production Cost';
                    ToolTip = 'Enter the production cost.';
                }
                field(LaborCost; laborCost)
                {
                    ApplicationArea = All;
                    Caption = 'Labor Cost';
                    ToolTip = 'Enter the labor cost.';
                }
                field(MaterialCost; materialCost)
                {
                    ApplicationArea = All;
                    Caption = 'Material Cost';
                    ToolTip = 'Enter the material cost.';
                }
                field(OverheadCost; overheadCost)
                {
                    ApplicationArea = All;
                    Caption = 'Overhead Cost';
                    ToolTip = 'Enter the overhead cost.';
                }

                field(RunTests; dummyText)
                {
                    ApplicationArea = All;
                    Caption = 'Run';
                    ToolTip = 'Run the tests to calculate the total price and profit margin.';
                    Editable = false;

                    
                
                    trigger OnDrillDown()
                    begin
                        // Perform calculations here
                        if discount > 0 then
                            discountedPrice := price - (price * discount / 100)
                        else
                            discountedPrice := price;
                        totalPrice := discountedPrice + (price * tax / 100) + shippingPrice;
                        profitMargin := (totalPrice - (productionCost + laborCost + materialCost + overheadCost)) / totalPrice * 100;
                        profitMarginValue := totalPrice - (productionCost + laborCost + materialCost + overheadCost);
                    end;
                }

                

            
            }

            
            

            group(Results)
            {

                field(ProfitMargin; profitMargin)
                {
                    ApplicationArea = All;
                    Caption = 'Profit Margin Percentage';
                    ToolTip = 'The profit margin percentage.';
                    Editable = false;
                }
                field(ProfitMarginValue;profitMarginValue)
                {
                    ApplicationArea = All;
                    Caption = 'Profit Margin Value';
                    ToolTip = 'The profit margin in value.';
                    Editable = false;
                }
                field(TotalPrice; totalPrice)
                {
                    ApplicationArea = All;
                    Caption = 'Total Price';
                    ToolTip = 'The Price The Customer Pays.';
                    Editable = false;
                }

            }
        }
    }

    
    var
        price: Decimal;
        tax: Decimal;
        shippingCost: Decimal;
        shippingPrice: Decimal;
        discount: Decimal;
        discountedPrice: Decimal; 
        productionCost: Decimal;
        laborCost: Decimal;
        materialCost: Decimal;
        overheadCost: Decimal;
        profitMargin: Decimal;
        profitMarginValue: Decimal;
        totalPrice: Decimal;



        dummyText: Text[100]; // Dummy field to trigger action

    trigger OnOpenPage()
    begin
        dummyText := '▶ Run Tests';
    end;
}