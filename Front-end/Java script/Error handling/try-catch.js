// Task: Wrap this code in try-catch and log "An error occurred"
let x = 10;



try{
    x = y + 5; // y is not defined
    console.log(x);
    
}catch{
    console.log("An error occured");
    
}

// Wrap this in try-catch and log the error.message
let obj = null;

try{
    console.log(obj.name); // will cause error
}catch(err){
    console.log("Error :",err);
    
}

// Add finally to this and print "Cleanup done."
try {
  let a = 1 / 0;
  console.log(a);
} catch (err) {
  console.log("Error caught");
} finally{
    console.log("Cleanup Done");
    
}

/* Error handling inside a function */
function divide(a, b) {

        try{
              if (b === 0) {
                  throw new Error("Cannot divide by zero");
                }
                     
                return a / b;
                
               
        } catch(err){
            console.log(err);            
        }
}


// Wrap this call in try-catch
let result = divide(10, 0);
console.log(result);

/* Error handling with ASYNC AWAIT */
async function fetchUser() {

    try{
          let response = await fetch("https://invalid.com/invalid-url");
  let data = await response.json();
  console.log(data);
    }
    catch(err){
        console.log("ERROR :",err);
        
    }
}

fetchUser(); // Wrap with try-catch



