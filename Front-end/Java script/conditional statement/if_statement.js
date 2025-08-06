
const readline=require("readline");
const rl=readline.createInterface({
    
    input:process.stdin,output:process.stdout
})


function check(){

    rl.question("Give me a number :", function(inp){

            const divide=parseInt(inp);
    if(divide % 5 ===0 ){
    console.log("Number is divisible by 5 !")
        }
    })
}
check();


