/* Simple API fetching... */

fetch("https://jsonplaceholder.typicode.com/posts/1")
.then( res => res.json())
.then( data => console.log(data))
.catch( err => console.log(err));

fetch("https://thisisnotarealapi.example1234.com/data") // wrong URL
.then( res => res.json())
.then( data => console.log(data))
.catch( err => console.log("Error occured :",err));