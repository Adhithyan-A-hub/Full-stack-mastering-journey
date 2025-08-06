const readline=require("readline");
const rl=readline.createInterface({

    input:process.stdin,output:process.stdout
})

function parity_check(){

    rl.question("Enter a number to check parity :", function (value){

        let usr_inp=parseInt(value);
        if(usr_inp % 2 === 0){
            console.log("Number",usr_inp,"is Even number");
            console.clear();
        } else {
            console.log("Number",usr_inp,"is Odd number");
            console.clear();
        }

    })
}
parity_check();