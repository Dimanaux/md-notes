//= require jquery2
//= require jquery-ujs

class Rating {
    constructor(element) {
        let data = element[0].dataset;
        this.username = data.noteUsername;
        this.noteSlug = data.noteSlug;
        this.rating = data.noteRating;
        this.myRatingId = data.myRatingId;
    }

    csrfToken() {
        return $('meta[name=csrf-token]').attr('content');
    }

    colorStars(rating = this.rating) {
        for (let star = 1; star <= 5; star++) {
            let color = star <= rating ? '★' : '☆';
            $(`[data-star="${star}"]`).text(color);
        }
    }

    addRating(value) {
        let httpVerb = this.myRatingId ? 'PATCH' : 'POST';
        let path  = `/users/${this.username}/notes/${this.noteSlug}/ratings/${this.myRatingId || ''}`;
        $.ajax({
            type: httpVerb,
            url: path,
            dataType: 'json',
            contentType: 'application/json',
            headers: { 'X-CSRF-Token': this.csrfToken() },
            data: JSON.stringify({
                rating: { value: value }
            }),
            success: response => {
                this.rating = value;
                this.colorStars();
                this.myRatingId = response.id;
            }
        });
    }
}

$(function() {
    if ($('#js-note-rating').length <= 0) {
        return;
    }

    const noteRating = new Rating($('#js-note-rating'));

    $('[data-star]').click(e => {
        noteRating.addRating(e.target.dataset.star);
    });

    $('[data-star]').hover(e => {
        noteRating.colorStars(e.target.dataset.star);
    });

    $('#js-note-rating').hover(() => {}, e => {
        noteRating.colorStars();
    });
});
