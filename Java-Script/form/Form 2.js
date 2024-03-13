
function submitForm(event) {
    event.preventDefault();

    let rName = document.getElementById('name').value;
    if (rName == "") {
        alert("Enter ur Full Name");
        return;
    }
    else if (rName.length < 4) {
        alert("Enter min 4 charecters");
        return;
    }

    let email = document.getElementById('email').value;
    const regEx = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (regEx.test(email)) {
    }
    else {
        alert("Plz Enter the real mail");
        return;
    }

    let password = document.getElementById('password').value;
    if (password.length < 8 || password.length > 20) {
        alert("Enter the min 8 charecters")
        return;
    }

    let gender = document.querySelector('input[name="gender"]:checked');
    if (gender == null) {
        alert("Enter the gender")
        return;
    }

    let hobby = document.querySelectorAll('input[name="hobby"]:checked');
    let hobbyValue = [];
    for (let i = 0; i < hobby.length; i++) {
        hobbyValue.push(hobby[i].value);
    }

    if (hobby.length == 0) {
        alert("Enter ur hobby")
        return;
    }

    let round = document.getElementById('round').value;
    if (round == 'Select One') {
        alert("Enter the round")
        return;
    }
    let dob = document.getElementById('dob').value;
    if (dob == "") {
        alert("Enter ur dob")
        return;
    }

    let address = document.getElementById('address').value;
    if (address == "") {
        alert("Enter ur address")
        return;
    }


    let output = "Name :" + rName + "\n";
    output += "Email :" + email + "\n";
    output += "Password :" + password + "\n";
    output += "Gender :" + gender.value + "\n";
    output += "Hobby :" + hobbyValue + "\n";
    output += "Round :" + round + "\n";
    output += "DOB :" + dob + "\n";
    output += "Address :" + address + "\n";


    let newWindow = window.open("", ('_blank'));
    newWindow.document.write("<pre>" + output + "</pre>");


}
let myForm = document.getElementById("myForm");
myForm.addEventListener("submit", submitForm);
