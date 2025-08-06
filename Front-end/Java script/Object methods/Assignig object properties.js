let object={1:undefined,2:undefined,3:undefined}
let array=["one","two","three"];
let newobj = {}

function assign(){
 /*    let i=1

    object[i]=array[i-1]

    i+=1; */


    for(let key in object){
        let i =0

       newobj[key]= array[i];

        
        i+=1;
    }
      console.log(newobj)
}

assign();

console.log(newobj)