/* Promise with .then and .catch */

function promiseresolve() {

    return new Promise((resolve) => {

        setTimeout(() => {

        resolve("Fullfilled");

        }, 2000);
    });
}

function promisereject() {

  return new Promise((resolve,reject) => {

    setTimeout(() => {

      reject("Rejected");

    }, 1000);
  });
}

promiseresolve().then((msg)=>{
    console.log(msg);
    
})

promisereject().catch((err)=>{
    console.log(err);
    
})