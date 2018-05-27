var db = firebase.firestore();




db.collection("CheckInWeb").get().then(function (querySnapshot) {
    querySnapshot.forEach(function (doc) {
        if (doc.data().Course == "CENG407") {
            list_div.innerHTML += " <div class='list-item'><h3>" + doc.data().Student + "&nbsp" + "&nbsp" + "&nbsp" + doc.data().Course + "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + "&nbsp" + doc.data().Date + "</h3></div>"
        }

        });
});





