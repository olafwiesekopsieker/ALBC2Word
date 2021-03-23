/// <summary>
/// Codeunit owsMedia Management (ID 72001).
/// </summary>
codeunit 72001 "owsMedia Management"
{
    /// <summary>
    /// getFileFromMediaField
    /// Get a File from a MediaField-Field as Base64-Content
    /// </summary>
    /// <param name="recRef">The Record-Reference</param>
    /// <param name="fieldID">The FieldID of the Field which represents the Media</param>
    /// <param name="base64Content">The returned content as Base64-content</param>
    /// <returns name="fileFound">Indicates if the file is found</returns>
    Procedure getFileFromMediaField(recRef: recordRef; fieldID: integer; var base64Content: Text) fileFound: boolean
    var
        mediaFieldRef: FieldRef;
        mediaID: guid;
        tempBlob: codeunit "Temp blob";
        tenantMedia: Record "Tenant Media";
        tenantMediaref: RecordRef;
        ins: instream;
        base64: codeunit "Base64 Convert";
        blobFieldRef: FieldRef;
    begin
        //Record Ref auf das Media Feld dort erhalte ich die MEDIAID 
        fileFound := FALSE;
        mediaFieldRef := recRef.field(FieldID);
        mediaID := mediaFieldref.Value;

        //Im Feld ID finde ich die gesuchte MEDIAID. Von dort hole ich mir den Content aus dem Feld Content
        //Über die Codeunit TempBlob erhalte ich den benötigten InStream um auf Base64 zu konvertieren
        tenantMedia.SETRANGE(ID, mediaID);
        IF tenantMedia.FINDSET() then BEGIN
            tenantMedia.CALCFIELDS(Content);
            tenantMediaref.GetTable(tenantMedia);
            blobFieldRef := tenantMediaref.FIELD(tenantMedia.Fieldno(Content));
            tempblob.FromFieldRef(blobFieldRef);
            tempblob.CreateInStream(ins);
            Base64Content := base64.toBase64(ins);
            FileFound := TRUE;
        END;

    end;

}