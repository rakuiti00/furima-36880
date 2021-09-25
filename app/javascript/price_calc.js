
function price(){

  //要素の取得 価格入力欄
  const inputPrice = document.getElementById("item-price"); 
  //要素の取得 販売手数料表示欄
  const commission = document.getElementById("add-tax-price");
  //要素の取得 販売価格
  const profit = document.getElementById("profit");

  inputPrice.addEventListener("input",() => {

    const addCommission = document.getElementById("add-tax-price");
    const addProfit = document.getElementById("profit");

    // 販売手数料、販売利益の表示
    addCommission.innerHTML = Math.floor(inputPrice.value * 0.1)
    addProfit.innerHTML = Math.floor(inputPrice.value - inputPrice.value * 0.1)

  })


};

window.addEventListener('load',price);