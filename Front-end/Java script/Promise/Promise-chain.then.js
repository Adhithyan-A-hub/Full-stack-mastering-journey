
function firstStep(){

    return new Promise( (resolve,reject)=>{

        setTimeout(() => {
            
            resolve("Step one Fullfilled...")
        }, 1000);
    })

}

firstStep().then( (msg)=>{
    console.log(msg)
    return(msg)
}) .then( (msg)=>{
    console.log(msg+"Second also fullfilled");
    
}).catch((err)=>{
    console.log("Eoor : ",err);
    
})