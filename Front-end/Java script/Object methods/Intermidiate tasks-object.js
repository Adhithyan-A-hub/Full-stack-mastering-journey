/* Looping through object */

let markList = {

    tamil:90,
    english:60,
    maths:99,
    physics:65,
    chemistry:80,
    biology:95
}

for ( let subject in markList){
    console.log(subject+":"+markList[subject]);
}

let prodList={
    prod1:["Lenova",35000,"Instock"],
    prod2:["Mac book",120000,"Instock"],
    prod3:["HP",50000,"NotInstock"]
}

    
for(let tosale in prodList ){

    if(prodList[tosale][2]==="Instock"){
        console.log(prodList[tosale][0]);
    }else{
        console.log(prodList[tosale][0]+" : No stocks")
    }

}

console.log(prodList["prod2"]);


