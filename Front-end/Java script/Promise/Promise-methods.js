let a =  Promise.resolve("Success1");
let b = Promise.resolve("Success2");
let c = Promise.reject("failed");
let d = new Promise( (resolve)=>{
    setTimeout(() => {
        resolve("resolved after 3s");
        
    }, 3000);
})


Promise.all([a, b])
.then( (res)=>{
    console.log(res);

}) /* [ 'Success1', 'Success2' ] - Because both are fullfilled */

Promise.all([a, b, c])
.then( (res)=>{
    console.log(res)
}).catch( (err)=>{
    console.log(err);
    
})  /* Failed - because the 3rd promise rejected..*/

Promise.allSettled([a,b,c])
.then( res => console.log(res));
/* [
  { status: 'fulfilled', value: 'Success1' },
  { status: 'fulfilled', value: 'Success2' },
  { status: 'rejected', reason: 'failed' }
] */

Promise.race([c,d]).then( res => console.log(res)).catch(err => console.log(err)); /* Failed - beacuse returns the first settled promise value */

Promise.any([c,d]).then( res => console.log(res)).catch(err => console.log(err)); /* Resolved after 3s - Because returns firts fullfilled promise value */
