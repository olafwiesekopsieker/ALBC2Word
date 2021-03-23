/// <summary>
/// Page MediaList (ID 50100).
/// </summary>
page 72002 owsTenantMediaList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Tenant Media";
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                    
                }

                field("Mime Type"; rec."Mime Type")
                {
                    ApplicationArea = All;
                    
                }

                field(Content; rec.Content)
                {
                    ApplicationArea = All;
                    
                }
                field(Filename; rec."File Name")
                {
                    ApplicationArea = All;
                    
                }

            }
        }
        area(Factboxes)
        {
            
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction();
                begin
                    
                end;
            }

            action(OpenCard)
            {
                ApplicationArea = All;
                RunObject=Page owsMediaCard;
                RunPageOnRec=true;
                trigger OnAction();
                begin
                    
                end;
            }

        }


    }
}