//= require jquery2
//= require jquery-ujs

class NoteRating {
    constructor(selector) {
        this.element = $(selector)[0];
        window.q = this.element;
        console.log(this.element);
        this.fetchRating();
    }

    csrfToken() {
        return $('meta[name=csrf-token]').attr('content');
    }

    fetchRating() {
        this.username = this.element.dataset.noteUsername;
        this.noteSlug = this.element.dataset.noteSlug;

        $.ajax({
            url: `/users/${this.username}/notes/${this.noteSlug}/ratings`,
            type: 'GET',
            dataType: 'json',
            contentType: 'application/json',
            headers: { 'X-CSRF-Token': this.csrfToken() },
            success: function(response) {
                let rating = response
                    .map(rating => rating.value)
                    .reduce((a, b) => a + b, 0) / response.length;
                $('#rating').text(rating);
            }
        });
    }

    addRating(value) {
        this.username = this.element.dataset.noteUsername;
        this.noteSlug = this.element.dataset.noteSlug;

        $.ajax({
            url: `/users/${this.username}/notes/${this.noteSlug}/ratings`,
            type: 'POST',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'X-CSRF-Token': this.csrfToken()
            },
            data: JSON.stringify({
                rating: {
                    value: value
                }
            }),
            success: console.log
        });
    }
}

if ($('.js-note-rating').length > 0) {
    new NoteRating('.js-note-rating');
}
