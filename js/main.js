

function loadFile(url,callback){
       
    PizZipUtils.getBinaryContent(url,callback);
}

function createDOCX(s, d, f){
    
    var b; 
    
    //back to Binary
    try{
       b=atob(s);
    } catch(e)
    {
        console.error(e);
    }
       
    //Binary to new ZIP-Object
    try{
    var zip = new PizZip(b);
    } catch(e)
    {
        console.error(e);
    }
    console.log(zip);
    var doc;

    try {
        doc=new window.docxtemplater(zip);
        console.log(doc);
    } catch(error) 
    {
        // Catch compilation errors (errors caused by the compilation of the template : misplaced tags)
        errorHandler(error);
    }

    // doc.setData({
    //     first_name: 'John',
    //     last_name: 'Doe',
    //     phone: '0652455478',
    //     description: 'New Website'
    // });

    doc.setData(d);

    try {
        // render the document (replace all occurences of {first_name} by John, {last_name} by Doe, ...)
        doc.render();
    }
    catch (error) {
        // Catch rendering errors (errors relating to the rendering of the template : angularParser throws an error)
        errorHandler(error);
    }

    //Output the document using Data-URI
    var out=doc.getZip().generate({
        type:"blob",
        mimeType: "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    }) 
    saveAs(out,f)


    
    

}



