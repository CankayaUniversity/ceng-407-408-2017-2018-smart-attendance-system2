var db = firebase.firestore();

function storeData() {
    var text1 = document.getElementById("name-field").value;
    var text2 = document.getElementById("code-field").value;

    db.collection("Course").doc(text1).set({
        CourseCode: text1,
        CourseName: text2
       
    })
      

            
        


    
}