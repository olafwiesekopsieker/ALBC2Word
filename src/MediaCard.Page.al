/// <summary>
/// Page MediaCard (ID 50101).
/// </summary>
page 72001 owsMediaCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Tenant Media";
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ID; rec.ID)
                {
                    ApplicationArea = All;
                    
                }

                field(Con; rec.Content)
                {
                    ApplicationArea = All;
                    MultiLine=true;

                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}