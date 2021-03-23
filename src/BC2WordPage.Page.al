/// <summary>
/// Page PageWithAddIn (ID 50130).
/// </summary>
page 72000 owsBC2WordPageWithAddIn
{
    UsageCategory=Administration;
    ApplicationArea=all;
    caption = 'BC2Word';
    
    layout
    {
        area(Content)
        {
             // The control add-in can be placed on the page using usercontrol keyword.
            usercontrol(owsBC2WordAddin; owsBC2WordAddIn)
            {

                ApplicationArea = All;
                
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action(CreateDoc)
            {
                ApplicationArea = All;
                caption = 'Word Dokument generieren';
                
                trigger OnAction();
                var 
                   docatt : record "Document Attachment";
                   refdocatt: recordref;
                   Customer: Record customer;
                   data: JsonObject;
                   BC2WordMgmt: codeunit "owsBC2Word Management";
                
                begin
                    docatt.SETRANGE("Table ID",database::customer);
                    docatt.SETRANGE("No.", '01121212');
                    customer.GET('01121212');
                    if docatt.FINDSET(FALSE, FALSE) then BEGIN                    
                       begin
                            //Set Media Field of Template
                            refdocatt.GetTable(docatt);
                            BC2WordMgmt.setAddIn(currpage.owsBC2WordAddin);
                            BC2WordMgmt.setTemplateDOCX(refdocatt,docatt.fieldno("Document Reference ID"));

                            //Define Data                       
                            data.Add('Firmenname', Customer.Name);
                            data.Add('Adresse', Customer.Address);
                            data.Add('PLZ', Customer."Post Code");
                            data.Add('Ort', Customer.City);
                            data.Add('Datum', Normaldate(Workdate));

                            //setdata in to Dokument
                            BC2WordMgmt.setData(data);

                            // The control add-in methods can be invoked via a reference to the usercontrol.
                            BC2WordMgmt.createDOCXOnClient('testdocument.docx');   
                        end;
                    

                    end;

                    
                end;
            }
        }
    }


   

}