let signin_form = document.querySelector('#signin-form')

let signin_btn = document.querySelector('#signin-btn')

let validateEmail = (email) => {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/

    return re.test(String(email).toLowerCase())
}
function validatePass(password) {
    const re = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    return re.test(password);
  }

let checkSigninInput = (input) => {
    let err_span = signin_form.querySelector(`span[data-err-for="${input.id}"]`)
    let val = input.value.trim()
    let form_group = input.parentElement
    var checkPass = validatePass(input); 
    switch(input.getAttribute('type')) {
        case 'password':
            
            if (val.length < 8 || checkPass===false ) {
                form_group.classList.add('err')
                form_group.classList.remove('success')
                err_span.innerHTML = 'Password must be at least 8 characters, uppercase and lowercase'
            } else {
                form_group.classList.add('success')
                form_group.classList.remove('err')
                err_span.innerHTML = ''
            }
            break;
        case 'email':
            if (val.length === 0 || !validateEmail(val)) {
                form_group.classList.add('err')
                form_group.classList.remove('success')
                err_span.innerHTML = 'Email is invalid'
            } else {
                form_group.classList.add('success')
                form_group.classList.remove('err')
                err_span.innerHTML = ''
            }
    }
}

 let checkSigninForm = () => {
    let inputs = signin_form.querySelectorAll('.form-input')
    inputs.forEach(input => checkSigninInput(input))
}

signin_btn.onclick = () => {
    checkSigninForm()
}

let inputs = signin_form.querySelectorAll('.form-input')
inputs.forEach(input => {
    input.addEventListener('focusout', () => {
        checkSigninInput(input)
    })
})