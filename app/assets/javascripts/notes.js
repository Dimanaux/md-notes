//= require jquery2
//= require jquery-ujs

class NoteRating {
    constructor(element) {
        this.element = element;
        this.username = element.dataset.noteUsername;
        this.noteSlug = element.dataset.noteSlug;
    }

    csrfToken() {
        return $('meta[name=csrf-token]').attr('content');
    }

    fetchRating() {
        element.text(element.dataset.noteRating);
    }

    addRating(value) {
        $.ajax({
            url: `/users/${this.username}/notes/${this.noteSlug}/ratings`,
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            headers: { 'X-CSRF-Token': this.csrfToken() },
            data: JSON.stringify({
                rating: { value: value }
            })
        });
    }
}

if ($('#js-note-rating').length > 0) {
    const noteRating = new NoteRating($('#js-note-rating'));
    noteRating.fetchRating();
}
