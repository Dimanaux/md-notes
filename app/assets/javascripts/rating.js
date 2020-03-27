//= require jquery2
//= require jquery-ujs

class Rating {
    constructor(element) {
        let data = element[0].dataset;
        this.method = data.method;
        this.path = data.path;
        this.rating = data.noteRating;
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
        $.ajax({
            type: this.method,
            url: this.path,
            dataType: 'json',
            contentType: 'application/json',
            headers: { 'X-CSRF-Token': this.csrfToken() },
            data: JSON.stringify({
                rating: { value: value }
            }),
            success: response => {
                this.rating = response.average_rating;
                this.colorStars();
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
