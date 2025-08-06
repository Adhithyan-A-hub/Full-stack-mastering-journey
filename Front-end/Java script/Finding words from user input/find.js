document.addEventListener("DOMContentLoaded",function(){

    const paraIn =document.getElementById("inp");
    const wordIn =  document.getElementById("inp2");
    const checkBtn =  document.getElementById("chck");
    const result = document.getElementById("p");

   function findWord(){ 
    let string=paraIn.value;
    
    let word2Search = wordIn.value.trim();

    let array=string.split(" ");

    let found=array.filter(str => str === word2Search);

    

    if (string == ""){

        result.textContent="Please give input";

    } else if(word2Search == ""){

        result.textContent="Please give the word to find !";

    } else if(found == ""){

        result.textContent="No words are matching !";
    }else{

        result.textContent=found.length;
            console.log((found));
            
       
    }


   }

   checkBtn.addEventListener("click",findWord)
})