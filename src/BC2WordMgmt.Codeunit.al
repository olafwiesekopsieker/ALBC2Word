

/// <summary>
/// Codeunit owsBC2Word Management (ID 72000).
/// </summary>
codeunit 72000 "owsBC2Word Management"
{
    var
        AddIn: controladdin owsBC2WordAddIn;
        base64Content: text;
        jsonData: jsonObject;

    /// <summary>
    /// setAddIn.
    /// Sets the ControlAddin, which manipulates the Docx-Document
    /// </summary>
    /// <param name="_AddIn">VAR ControlAddIn.</param>
    procedure setAddIn(_AddIn: ControlAddIn owsBC2WordAddIn)
    begin
        AddIn := _Addin;
    end;

   /// <summary>
   /// setTemplateDOCX
   /// Sets the Template-Docx which is the base of the to manipulating Document
   /// </summary>
   /// <param name="recRef">The Record-Reference in which the DOCX-Template is stored</param>
   /// <param name="fieldID">The FieldID of the Field in which the DOCX-Template is stored</param>
    procedure setTemplateDOCX(recRef: recordRef; fieldID: integer)
    var
       owsMediaMgmt: codeunit "owsMedia Management";
    begin
       IF owsMediaMgmt.getFileFromMediaField(recRef, FieldID, base64Content) THEN; 
    end;

    /// <summary>
    /// setData.
    /// </summary>
    /// <param name="locJsonData">Sets the Data which will be modified in the template</param>
    procedure setData(locJsonData: jsonObject)
    var
    begin
        JsonData:=locJsonData;
    end;

    /// <summary>
    /// createDOCXOnClient
    /// </summary>
    /// <param name="Filename">The Filename of the Target-Document, which will be downloaded to the Client-Computer</param>
    procedure createDOCXOnClient(Filename: text)
    begin
        Addin.createDOCX(base64content, jsonData, Filename);
    end;


}