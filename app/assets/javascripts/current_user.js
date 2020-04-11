class User {
    constructor(data = {}) {
        this.data = data;
    }

    get(param) {
        return this.data[param];
    }

    isSignedIn() {
        return this.get("id") != null;
    }
};

App.currentUser = new User(App.currentUserData);
