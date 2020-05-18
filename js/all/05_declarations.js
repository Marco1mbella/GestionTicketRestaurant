

function init()
{
    console.log("Hello, fonction init");

    var a = "yop";
    aa = "yep yep";

    testPortee01();

    console.log("valeur de a : " + a);
    // console.log("valeur de b : " + b); //-> erreur, not defined
    // console.log("valeur de c : " + c);//-> erreur, not defined


    testPortee02();
    console.log("valeur de b : " + b); 

    b = 'coincoin';
    console.log("valeur de b après modif : " + b); 

    console.log("Fin fonction init");
}


function testPortee01()
{
    console.log("   ----------------");
    console.log("   Fonction testPortee01");
    // console.log("valeur de a : " + a); //-> erreur, not defined
    console.log("   valeur de aa : " + aa); 
    console.log("   Fin fonction testPortee01");
    console.log("   -----------------");
}


function testPortee02()
{
    b = 50;
    var c = false;
}

