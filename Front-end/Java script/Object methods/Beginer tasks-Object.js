const personal = {

    name:"adhi",
    age: 25,
    city : "Peranbalur"

}

console.log(personal.name);
console.log(personal.age);
console.log(personal.city);
console.log(Object.entries(personal)) /* Prints full object within array */

/* Adding and deleting properties */

let empty={};

empty.name="Adhi";
empty.skill="Coding";
empty.experience=2;

console.log(Object.entries(empty));

delete empty.experience;  /* Deletes the object(key) */

console.log(Object.entries(empty));

/* Nested onjects accessing */

let student = {
    name:"Gandhi",
    age:68,
    address:{
        city:"Ariyalur",
        pincode:621708
    }
}

console.log(student.address.pincode); /* Consoles the pincode key's value */

/* Using funtion inside object  */

let calculator = {
    
    add:function (a,b){
        return a+b;
    }

    /* add(a,b){

        return a+b;

    } */
}

console.log(calculator.add(2,5));