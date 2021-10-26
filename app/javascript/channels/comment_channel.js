import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<span>${data.nickname}: </span><span>${data.content.text}</span>`;
    // const user = `<span>${data.nickname}</span>`;
    // console.log(data.content.text)
    // console.log(data.content)
    // console.log(data)
    // console.log(data.nickname)
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';

    // 必要なデータはとれてるので、あとはそれっぽいHTML要素を生成すれば一応形にはなるっぽい
    // const messages = document.getElementById('messages');
    // const newMessage = document.getElementById('message_text');
    // messages.insertAdjacentHTML('afterbegin', html);
    // newMessage.value='';
  }
});
