
function price(){

  const inputPrice = document.getElementById("item-price"); 
  const commission = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  inputPrice.addEventListener("input",() => {
    
    commission.innerHTML = Math.floor(inputPrice.value * 0.1)
    profit.innerHTML = Math.floor(inputPrice.value - inputPrice.value * 0.1)
  })
};

window.addEventListener('load',price);