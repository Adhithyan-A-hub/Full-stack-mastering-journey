document.addEventListener("DOMContentLoaded",function(){

    const cnvrtType =document.getElementById("slct");
    const input = document.getElementById("inp1");
    const result = document.getElementById("rslt")

    const button = document.getElementById("butt1");
    
    button.addEventListener("click",()=>{


    if(cnvrtType.value == 1){

    result.textContent= `${(((input.value-32)*5)/9).toFixed(2)}*C`;
    }
    else{
        result.textContent= ` ${input.value*9/5+32}*F`;
    }

    })



})