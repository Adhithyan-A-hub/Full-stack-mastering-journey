document.addEventListener("DOMContentLoaded", function () {
  const cartCard = document.getElementById("cartmenu");
  const productDetail = document.getElementById("prdct-dtl");
  const productType = document.getElementById("prdct");
  const productName = document.getElementById("pr-nm");
  const productPrice = document.getElementById("pr-prc");
  const add2cart = document.getElementById("sbmt");
  const addProductdetail = document.getElementById("sbmt-dtl");
  const close = document.getElementById("cls");
  const close2 = document.getElementById("cls2");
  const showcrt = document.getElementById("shw");


  /* Cart list definings */

  const cartList =  document.getElementById("crt-lst");
  const listype = document.getElementById("ctgrs");

  const tdi =[document.getElementById("td1"),
                document.getElementById("td2"),
                document.getElementById("td3"),
                document.getElementById("td4"),
                document.getElementById("td5"),
                document.getElementById("td6"),
            ]


  const itemBut =  document.getElementById("items-type")
  const itemBut2 =  document.getElementById("items-type2")
  const itemBut3 =  document.getElementById("items-type3")
  
  const cartProducts = {
  Phone: [],
     Laptop: [],
     Tv: [] };

  add2cart.addEventListener("click", () => {
    productDetail.style.display = "inline-block";
    cartCard.style.display = "none";
  });

  function cartupdate() {
    if (productName.value === "" || productPrice.value === "") {
      alert("Please add product details");
      productName.value="";
      productPrice.value="";
    } else if (
      cartProducts[productType.value].some(
        (item) =>
          item.name === productName.value && item.price === productPrice.value
      )
    ) {
      alert("Product already added to cart !");
      productName.value="";
      productPrice.value="";
    } else {
      cartProducts[productType.value].push({
        name: productName.value,
        price: productPrice.value
      });

      alert("Product Added To Cart !");
      productName.value="";
      productPrice.value="";
    }
  }

  addProductdetail.addEventListener("click", () => {
    cartupdate();

    console.log(cartProducts[productType.value]);
  });

  close.addEventListener("click", () => {
    productDetail.style.display = "none";
    cartCard.style.display = "inline-block";
  });

  /* Cart-items list */

  function cartItemsFetch (category){

    let prodkind=cartProducts[category];
  
    let a=0;  /* To avoid overlapping tdi index have to be instiallized to a variable !! */

if(prodkind.length===0){
  tdi[0].textContent=" Your cart is";
  tdi[1].textContent="Empty"

  }
    
  else{
for(let i=0;i < prodkind.length;i++){

  tdi[a].textContent=prodkind[i].name;
    tdi[a + 1].textContent=prodkind[i].price;

    a+=2;
}
}



}

itemBut.addEventListener("click", () =>{cartItemsFetch("Phone")});
itemBut2.addEventListener("click", () =>{ cartItemsFetch("Laptop")});
itemBut3.addEventListener("click", () =>{ cartItemsFetch("Tv")});

  showcrt.addEventListener("click", () =>{
    cartList.style.display="inline-block";
    cartCard.style.display="none";
  })
  close2.addEventListener("click", () =>{
    cartCard.style.display = "inline-block";
    cartList.style.display="none";
  })

});
