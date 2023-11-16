const user = sessionStorage.getItem("user")
const jsonUser = JSON.parse(user)

const loadPage = () => {
    const wellcom = document.getElementById("wellcom")
    wellcom.innerHTML = `:)hello to ${jsonUser.name} ${jsonUser.lastName}  wellcome to home page`
}

const showUpdate = () => {    
    const register = document.getElementById("register")
    register.style.visibility = "initial"
    const userName = document.getElementById("userName")
    userName.value = jsonUser.userName
    const password = document.getElementById("pass")
    password.value = jsonUser.password
    const name = document.getElementById("name")
    name.value = jsonUser.name
    const lastName = document.getElementById("lastName")
    lastName.value = jsonUser.lastName
}
const update = async () => {
    try {
        const userName = document.getElementById("userName").value
        const password = document.getElementById("pass").value
        const name = document.getElementById("name").value
        const lastName = document.getElementById("lastName").value
        const Id = jsonUser.id

        const user = { Id, userName, password, name, lastName }

        const res = await fetch(`/api/users/${Id}`,
            {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(user)
            });
            //If (res.status == 200) save the new user details in SessionStorage
            // and   alert a suitable message
            //else---
        if (!res.ok)
            //alert("Failed to update user details") instead of throwing an error
            throw new Error("Failed to save changes")
        window.location.href = "./login.html"
    
    }
    catch (ex) {
        alert(ex.message)
    }
}

