import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {

    const text = `
    <div class="comment-one">
    <p>
    ${data.date}
    <br>
    ${data.user.nickname}
    <br>
    ${data.content.text}
    </p>
    </div>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comments_text');
    comments.insertAdjacentHTML('afterbegin', text);
    newComment.value='';
  }
});
