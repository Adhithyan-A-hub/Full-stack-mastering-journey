function stepOne(){

    return new Promise( (resolve,reject)=>{
        setTimeout(() => {
            resolve("Step one fulfilled")
        }, 1000);
    })
    
}
function stepTwo(){

    return new Promise( (resolve,reject)=>{
        setTimeout(() => {
            resolve("Step two fulfilled")
        }, 1000);
    })
    
}
function stepThree(){

    return new Promise( (resolve,reject)=>{

        setTimeout(() => {
            reject("Step Three rejected")
        }, 1000);
    })    
}

async function solve() {
    
    try{
        let res1 = await stepOne();
        console.log(res1);

        let res2 = await stepTwo();
        console.log(res2);

        let res3 = await stepThree();
        console.log(res3);        
    } catch(err){
        console.log("Error :",err);
        
    }
} 

solve();