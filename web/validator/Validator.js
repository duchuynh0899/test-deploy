let check = 0;

/*
 to check if email is in valid format and notice this form of email to user
 */
function checkMail(nameOfForm) {
    const email = document[nameOfForm].username.value;
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    //email is empty
    if (email == '') {
        // Create dynamic div
        const mailError = document.createElement('div');
        mailError.append('The Email should not be blank.');
        mailError.setAttribute('class', 'alert-danger alert error');
        mailError.setAttribute('role', 'alert');
        //  Append div to parent element
        document.getElementById('divCheckEmail').appendChild(mailError);
        check = 0;
    }
    //email is not in format
    else if (!re.test(String(email).toLowerCase())) {
        // Create dynamic div
        const mailError = document.createElement('div');
        mailError.append('Please input your correct email address.');
        mailError.setAttribute('class', 'alert-danger alert error');
        mailError.setAttribute('role', 'alert');
        // Step 2: Append div to parent element
        document.getElementById('divCheckEmail').appendChild(mailError);
        check = 0;
    }
}



/*function checkName(nameOfInput,name,nameOfdiv,nameOfForm) {
 const username = document.registerForm[nameOfInput].value;
 if (username == '') {
 const usernameError = document.createElement('div');
 usernameError.append('The '+name+ ' should not be blank');
 usernameError.setAttribute('class', 'alert-danger alert error');
 usernameError.setAttribute('role', 'alert');
 // Append div to parent element
 document.getElementById(nameOfdiv).appendChild(usernameError);
 check = 0;
 }
 }*/

function checkPhone(nameOfForm) {
    const phone = document[nameOfForm].phone.value;
    const re = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
    if (phone == '') {
//        const phoneError = document.createElement('div');
//        phoneError.append('Phone can not empty');
//        phoneError.setAttribute('class', 'alert-danger alert error');
//        phoneError.setAttribute('role', 'alert');
//        //  Append div to parent element
//        document.getElementById('divCheckPhone').appendChild(phoneError);
//        check = 0;
    } else if (!re.test(String(phone).toLowerCase())) {
        // Step 1: Create dynamic div
        const phoneError = document.createElement('div');
        phoneError.append('Please input your correct phone number.');
        phoneError.setAttribute('class', 'alert-danger alert error');
        phoneError.setAttribute('role', 'alert');
        // Step 2: Append div to parent element
        document.getElementById('divCheckPhone').appendChild(phoneError);
        check = 0;
    }
}

function checkAge(nameOfForm) {
    const age = document[nameOfForm].age.value;
    const re = /^(1[0123456789]|[2-9]\d)$/;
    if (age == '') {
//        const phoneError = document.createElement('div');
//        phoneError.append('Phone can not empty');
//        phoneError.setAttribute('class', 'alert-danger alert error');
//        phoneError.setAttribute('role', 'alert');
//        //  Append div to parent element
//        document.getElementById('divCheckPhone').appendChild(phoneError);
//        check = 0;
    } else if (!re.test(String(age).toLowerCase())) {
        // Step 1: Create dynamic div
        const ageError = document.createElement('div');
        ageError.append('Please input your correct age from (10 to 99).');
        ageError.setAttribute('class', 'alert-danger alert error');
        ageError.setAttribute('role', 'alert');
        // Step 2: Append div to parent element
        document.getElementById('divCheckAge').appendChild(ageError);
        check = 0;
    }
}

function checkUnit(nameOfForm) {
    const unit = document[nameOfForm].unit.value;
    const re = /^[Kk]{1}\d{2}$/;
    if (unit == '') {
//        const phoneError = document.createElement('div');
//        phoneError.append('Phone can not empty');
//        phoneError.setAttribute('class', 'alert-danger alert error');
//        phoneError.setAttribute('role', 'alert');
//        //  Append div to parent element
//        document.getElementById('divCheckPhone').appendChild(phoneError);
//        check = 0;
    } else if (!re.test(String(unit).toLowerCase())) {
        // Step 1: Create dynamic div
        const unitError = document.createElement('div');
        unitError.append('Please input your correct unit (eg K13,K14...)');
        unitError.setAttribute('class', 'alert-danger alert error');
        unitError.setAttribute('role', 'alert');
        // Step 2: Append div to parent element
        document.getElementById('divCheckUnit').appendChild(unitError);
        check = 0;
    }
}
//
function checkInputCode(nameOfForm) {
    const code = document[nameOfForm].inputCode.value;
    
    if (code == '') {
        const phoneError = document.createElement('div');
        phoneError.append('code can not empty');
        phoneError.setAttribute('class', 'alert-danger alert error');
        phoneError.setAttribute('role', 'alert');
        //  Append div to parent element
        document.getElementById('divCheckCode').appendChild(phoneError);
        check = 0;
    } 
}

function checkRepass(nameOfForm) {
    const pass = document[nameOfForm].pass.value;
    const repass = document[nameOfForm].repass.value;
    if (pass != repass) {
        const repassError = document.createElement('div');
        repassError.append('re-password not match password');
        repassError.setAttribute('class', 'alert-danger alert error');
        repassError.setAttribute('role', 'alert');
        //  Append div to parent element
        document.getElementById('divCheckRePass').appendChild(repassError);
        check = 0;
    }
}

function checkImg() {
    if ($('#avatarImg')[0].files[0] != null) {
        var ftype = $('#avatarImg')[0].files[0].type;
        if (ftype == 'image/png' || ftype == 'image/gif' || ftype == 'image/jpeg' || ftype == 'image/pjpeg') {

        } else {
            const imgError = document.createElement('div');
            imgError.append('Unsupported File!');
            imgError.setAttribute('class', 'alert-danger alert error');
            imgError.setAttribute('role', 'alert');
            document.getElementById('divCheckImg').appendChild(imgError);
            check = 0;
        }
    }

}

function checkPass(nameOfForm) {
    const password = document[nameOfForm].pass.value;
    const re = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    //email is empty
    if (password == '') {
        // Create dynamic div
        const passError = document.createElement('div');
        passError.append('The password should not be blank.');
        passError.setAttribute('class', 'alert-danger alert error');
        passError.setAttribute('role', 'alert');
        //  Append div to parent element
        document.getElementById('divCheckPass').appendChild(passError);
        check = 0;
    }
    //email is not in format
    else if (!re.test(String(password))) {
        // Create dynamic div
        const passError = document.createElement('div');
        passError.append('Please input your correct password form (minimum eight characters, at least one letter and one number).');
        passError.setAttribute('class', 'alert-danger alert error');
        passError.setAttribute('role', 'alert');
        // Step 2: Append div to parent element
        document.getElementById('divCheckPass').appendChild(passError);
        check = 0;
    }
}


/*function checkCountryChoose(){
 const country = document.registerForm.country.value;
 if (country == 'Select country') {
 const ChooseError = document.createElement('div');
 ChooseError.append('Please select your country');
 ChooseError.setAttribute('class', 'alert-danger alert error');
 ChooseError.setAttribute('role', 'alert');
 //  Append div to parent element
 document.getElementById('divCountry').appendChild(ChooseError);
 check = 0;
 }
 }*/

/*function checkPositionChoose(){
 const position = document.registerForm.position.value;
 if (position == 'Choose desired position') {
 const ChooseError = document.createElement('div');
 ChooseError.append('Please select the position.');
 ChooseError.setAttribute('class', 'alert-danger alert error');
 ChooseError.setAttribute('role', 'alert');
 //  Append div to parent element
 document.getElementById('divPosition').appendChild(ChooseError);
 check = 0;
 }
 }*/




function checkValidatorForRegister() {
    check = 1;
    document.querySelectorAll('div.error').forEach(e => e.remove());
    //checkName('fistName','First Name','yourname1');
    //checkName('lastName','Last Name','yourname2');
    checkMail('registerForm');
    checkPass('registerForm');
    checkRepass('registerForm');
    //checkPhone();
    //checkCountryChoose();
    //checkPositionChoose();
}



function checkValidatorForInputNewPass() {
    check = 1;
    document.querySelectorAll('div.error').forEach(e => e.remove());
    //checkName('fistName','First Name','yourname1');
    //checkName('lastName','Last Name','yourname2');

    checkPass('inputNewPassForm');
    checkRepass('inputNewPassForm');
    //checkPhone();
    //checkCountryChoose();
    //checkPositionChoose();
}

function checkValidatorForChangePassword() {
    check = 1;
    document.querySelectorAll('div.error').forEach(e => e.remove());
    //checkName('fistName','First Name','yourname1');
    //checkName('lastName','Last Name','yourname2');

    checkPass('changePassForm');
    checkRepass('changePassForm');
    //checkPhone();
    //checkCountryChoose();
    //checkPositionChoose();
}

function checkValidatorForUpdateProfile()
{
    check = 1;
    document.querySelectorAll('div.error').forEach(e => e.remove());
    checkImg();

}

function checkValidatorForUpdateStudentProfile()
{
    check = 1;
    document.querySelectorAll('div.error').forEach(e => e.remove());
    checkPhone('updateStudentForm');
    checkAge('updateStudentForm');
    checkUnit('updateStudentForm');
    

}

function checkValidatorForUpdateSellerProfile()
{
    check = 1;
    document.querySelectorAll('div.error').forEach(e => e.remove());
    checkPhone('updateSellerForm');
    checkAge('updateSellerForm');
    

}

function checkValidatorForUpdateAdminProfile()
{
    check = 1;
    document.querySelectorAll('div.error').forEach(e => e.remove());
    checkPhone('updateAdminForm');
    checkAge('updateAdminForm');
    

}

function checkValidatorForSearchListStudent()
{
    check = 1;
    document.querySelectorAll('div.error').forEach(e => e.remove());
    
    checkUnit('searchListStudent');
    

}

function checkValidatorForInputCode() {
    check = 1;
    document.querySelectorAll('div.error').forEach(e => e.remove());
    //checkName('fistName','First Name','yourname1');
    //checkName('lastName','Last Name','yourname2');
    checkInputCode('authenticate');
    //checkPhone();
    //checkCountryChoose();
    //checkPositionChoose();
}

function checkValidatorForLogin() {
    check = 1;
    document.querySelectorAll('div.error').forEach(e => e.remove());
    //checkName('fistName','First Name','yourname1');
    //checkName('lastName','Last Name','yourname2');
    checkMail('loginForm');
    //checkPhone();
    //checkCountryChoose();
    //checkPositionChoose();
}

function checkValidatorForgotPassword_InputEmail() {
    check = 1;
    document.querySelectorAll('div.error').forEach(e => e.remove());
    //checkName('fistName','First Name','yourname1');
    //checkName('lastName','Last Name','yourname2');
    checkMail('inputEmailForm');
    //checkPhone();
    //checkCountryChoose();
    //checkPositionChoose();
}




//check if can send inf 
function checkSend() {
    if (check == 1)
        return true;
    else
        return false;
}
    