      document.addEventListener("DOMContentLoaded", function () {
        const input1 = document.getElementById("inp1");
        const input2 = document.getElementById("inp2");
        const result = document.getElementById("rslt");
        const checker = document.getElementById("chck");

        checker.addEventListener("click", compare); 
        
        function compare() {
          const x = Number(input1.value);
          const y = Number(input2.value);

          

          if (x > y) {
            console.log("1 is greater");
            result.textContent = x;

          } else if (x < y) {
            console.log("2 is greate`r");
            result.textContent = y;
            
          } else if (x == y){
            result.textContent = "Both are equal";
          }
          
          else {
            result.textContent="Give valid input !"
          }
        }
    });
      