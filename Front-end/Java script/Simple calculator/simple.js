document.addEventListener("DOMContentLoaded",function(){

    const input1 =  document.getElementById("inp1");
    const input2 =  document.getElementById("inp2");
    const button1 =  document.getElementById("butt1");
    const button2 =  document.getElementById("butt2");
    const result =  document.getElementById("rslt");



    button1.addEventListener("click",()=>{

        
        let inp1 = parseFloat(input1.value);
        let inp2 = parseFloat(input2.value);

        result.textContent=inp1*inp2;

    })

    button2.addEventListener("click",()=>{

        let inp1 = parseFloat(input1.value);
        let inp2 = parseFloat(input2.value);

        if(inp1 == 0 || inp2 == 0){

            result.textContent="Bro WTH is this bro ! Change 0 !";
            result.style.fontSize="1rem";
        }else if(inp1== undefined || inp2 == undefined){

            result.textContent="Bro pls enter number !"
        }else{

            result.textContent= inp1/inp2;
        }

    })


});