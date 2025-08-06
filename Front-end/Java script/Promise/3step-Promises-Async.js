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

async function updateUser() {
    
    try {
        let result = await loaduser();
        console.log(result);
        let result2 = await fetchPosts();
        console.log(result2);
        let result3 = await loadcomments();
        console.log(result3);
        
        
    } catch (error) {
        console.log(error);
        
    }
}

updateUser();