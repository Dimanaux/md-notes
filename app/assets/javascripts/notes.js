$(() => {
    let markdownNodes = document.querySelectorAll("[data-behaviour=markdown]");
    for (let element of markdownNodes) {
        element.innerHTML = marked(element.innerHTML);
    }

    let noteContentEdit = document.getElementById("note_content");
    if (noteContentEdit) {
        new SimpleMDE({ element: noteContentEdit });
    }
});
