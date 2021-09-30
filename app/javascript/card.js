const pay = () => {
  const submit = document.getElementById("button");
  submit.addEventListener("click",(e) => {
    e.preventDefault();
    console.log("フォーム送信ボタン押下時にイベント発火を確認")
  });

};

window.addEventListener("load", pay);