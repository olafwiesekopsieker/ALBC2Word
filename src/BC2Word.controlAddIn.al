// The controladdin type declares the new add-in.
/// <summary>
/// ControlAddIn SampleAddIn.
/// </summary>
controladdin owsBC2WordAddIn
{

    RequestedHeight = 20;
    MinimumHeight = 20;
    MaximumHeight = 20;

    // The Scripts property can reference both external and local scripts.
    Scripts = 'https://cdnjs.cloudflare.com/ajax/libs/knockout/3.4.2/knockout-debug.js',
            'https://cdnjs.cloudflare.com/ajax/libs/docxtemplater/3.20.1/docxtemplater.js',
            'https://unpkg.com/pizzip@3.0.6/dist/pizzip.js',
            'https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.js',
            'https://unpkg.com/pizzip@3.0.6/dist/pizzip-utils.js',
            './js/main.js';
    // The StartupScript is a special script that the web client calls once the page is loaded.
    StartupScript = './js/startup.js';

    // Specifies the StyleSheets that are included in the control add-in.
    StyleSheets = './js/skin.css';

    // Specifies the Images that are included in the control add-in.
    //Images = 'image.png';

    // The procedure declarations specify what JavaScript methods could be called from AL.
    // In main.js code, there should be a global function CallJavaScript(i,s,d,c) {Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('CallBack', [i, s, d, c]);}
    
   /// <summary>
   /// createDOCX.
   /// </summary>
   /// <param name="base64Content">text.</param>
   /// <param name="jsonData">JsonObject.</param>
   /// <param name="filename">text.</param>
    procedure createDOCX(base64Content:text; jsonData:JsonObject; filename:text);
    

    // The event declarations specify what callbacks could be raised from JavaScript by using the webclient API:
    // Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('CallBack', [42, 'some text', 5.8, 'c'])
    event Callback(s: text);
}