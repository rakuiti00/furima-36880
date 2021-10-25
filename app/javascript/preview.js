
// DOMContentLoadedという名前は固定の必要性あり
// どの画面でも画面ロード時に発火
document.addEventListener('DOMContentLoaded', function(){

  // ＃post_image要素がある場合
  if (document.getElementById("item-image")){
    console.log("test99999")
     // プレビュー表示する場所（親要素を指定）
    const ImagePreview = document.getElementById("image_preview");
   
    // ファイル選択時のインプット欄(ファイル名)に変更があった場合、発火
    document.getElementById("item-image").addEventListener('change', function(e){
    console.log("test99999")
    //画像が表示されている場合、存在している画像を削除する。
    const imageContent = document.querySelector('img');
    if (imageContent){
      imageContent.remove();
    }
    // ファイル情報の取得確認
    const imageFile = e.target.files[0];
    const blobURL = window.URL.createObjectURL(imageFile);

    // 表示する画像を生成
    const imageImage = document.createElement('img');
    imageImage.setAttribute('src',blobURL);

    //生成したHTMLをブラウザに表示する
    //imageDiv.appendChild(imageImage);
    ImagePreview.appendChild(imageImage);

  });
 }
});