$(() => {
    let noteContent = $('#js-note-content')[0];
    if (noteContent) {
        noteContent.innerHTML = marked(noteContent.innerHTML);
    }

    let noteContentEdit = document.getElementById("note_content");
    if (noteContentEdit) {
        new SimpleMDE({
            element: document.getElementById("note_content")
        });
    }

    let gravatars = document.querySelectorAll('img[data-email-hash]');
    for (let gravatar of gravatars) {
        let emailHash = gravatar.dataset.emailHash;
        gravatar.src = gravatarImageUrl(emailHash);;
    }
});

const gravatarImageUrl = (hash, size = 80, allowed_rating = 'g') =>
    `https://secure.gravatar.com/avatar/${hash}?size=${size}&default=mm&rating=${allowed_rating}`;
