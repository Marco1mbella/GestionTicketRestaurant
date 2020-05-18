

function init()
{
    console.log("Hello, fonction init");

    var monTab= new Array('hello',150,true,'coincoin');

    console.log("longueur tableau : " + monTab.length);

    monTab.forEach(function(elemCourant)
    {
        console.log("- " + elemCourant + " => " + typeof(elemCourant));
    });

    console.log("Fin fonction init");
}



