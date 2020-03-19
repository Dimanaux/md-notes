//= require jquery2
//= require jquery-ujs

function fetchRating() {
    $.ajax({
        url: '/users/era/notes/note-1/ratings',
        type: 'GET',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrfToken()
        },
        success: function(response) {
            let rating = response
                .map(rating => rating.value)
                .reduce((a, b) => a + b) / response.length;
            $('#rating').text(rating);
        }
    });
}

function addRating(value) {
    $.ajax({
        url: '/users/era/notes/note-1/ratings',
        type: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'X-CSRF-Token': csrfToken()
        },
        data: JSON.stringify({
            rating: {
                value: value
            }
        }),
        success: console.log
    });
}

function csrfToken() {
    return $('meta[name=csrf-token]').attr('content');
}
