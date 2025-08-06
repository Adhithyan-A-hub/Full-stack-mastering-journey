
function loaduser(){

    return new Promise( (resolve,reject)=>{

        setTimeout(() => {
            resolve("User Profile Loaded...")
        }, 1000);
    })
}

function fetchPosts(){

    return new Promise( (resolve,reject)=>{

        setTimeout(() => {
            
            resolve("User posts fetched...")
        }, 2000);
    })
}

function loadcomments(){

    return new Promise( (resolve,reject)=>{

        setTimeout(() => {
            
            resolve("Comments are Loaded...")
        }, 1500);
    })
}

loaduser().then((msg)=>{

    console.log(msg)
    return fetchPosts();
}).then( (msg2)=>{

    console.log(msg2);
    return loadcomments()
}).then( (msg3)=>{
    console.log(msg3);
    
}).catch((err)=>{
    console.log(err);
})

