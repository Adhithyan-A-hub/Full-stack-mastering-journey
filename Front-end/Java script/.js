  function cartItemsFetch (category){

    let prodkind=cartProducts[category]

    if(prodkind.length > 0){

      td1.textContent=prodkind[0].name
      td1v.textContent=prodkind[0].price

      td2.textContent=prodkind[1].name
      td2v.textContent=prodkind[1].price

      td3.textContent=prodkind[2].name
      td3v.textContent=prodkind[2].price
    }else{
      td1.textContent="Your cart is "
      td1v.textContent="Empty"
    }
  
}

itemBut.addEventListener("click", () =>{cartItemsFetch("Phone")});
itemBut2.addEventListener("click", () =>{ cartItemsFetch("Laptop")});
itemBut3.addEventListener("click", () =>{ cartItemsFetch("Tv")});

for(let i=0;i <= prodkind.length;i++){

    td1.textContent=prodkind[i].name;
    td1v.textContent=prodkind[i].name;

}