const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function check() {
  rl.question("\n Enter a number: ",
    function (input) {
      const number = Number(input); // convert string to number

      if (number %5 === 0) {
        console.log("You entered:", number, "is divisible by 5");
        rl.close();
    } else {
        console.error("Number",number, "is not divisible by 5 !");
        console.log("\n Wanna try again ?");
        check();
      }
    });
}

check();
