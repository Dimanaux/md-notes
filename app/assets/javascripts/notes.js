$(() => {
    let noteContent = $('#js-note-content')[0];
    if (noteContent) {
        noteContent.innerHTML = marked(noteContent.innerHTML);
    }

    let noteContentEdit = document.getElementById("note_content");
    if (noteContentEdit) {
        new SimpleMDE({ element: noteContentEdit });
    }
});
