const pay = () => {
  Payjp.setPublicKey("pk_test_ba96801c063aae04dc1be714");
  const submit = document.getElementById("button");
  submit.addEventListener("click",(e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_destination[number]"),
      cvc: formData.get("purchase_destination[cvc]"),
      exp_month: formData.get("purchase_destination[exp_month]"),
      exp_year: `20${formData.get("purchase_destination[exp_year]")}`,
    };

    Payjp.createToken(card, (status,response) => {
      if(status == 200) {
        const token = response.id;
        
      }


    });





  });

};

window.addEventListener("load", pay);