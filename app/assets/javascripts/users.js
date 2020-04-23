const gravatarImageUrl = (hash, size = 80) =>
    `https://secure.gravatar.com/avatar/${hash}?size=${size}&default=mm&rating=g`;

$(() => {
    let gravatars = document.querySelectorAll('img[data-email-hash]');
    for (let gravatar of gravatars) {
        let emailHash = gravatar.dataset.emailHash;
        gravatar.src = gravatarImageUrl(emailHash);
    }
});
