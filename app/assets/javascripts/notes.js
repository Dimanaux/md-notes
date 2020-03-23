$(function (argument) {
    let noteContent = $('#js-note-content')[0];
    if (noteContent) {
        noteContent.innerHTML = marked(noteContent.innerHTML);
    }

    let noteContentEdit = document.getElementById("note_content");
    if (noteContentEdit) {
        const simplemde = new SimpleMDE({
            element: document.getElementById("note_content")
        });
    }
});
