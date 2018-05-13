var db = firebase.firestore();




db.collection("Students").get().then(function (querySnapshot) {
        querySnapshot.forEach(function (doc) {

            list_div.innerHTML += " <div class='list-item'><h3>" + doc.data().name + "</h3></div>"
        });
});



