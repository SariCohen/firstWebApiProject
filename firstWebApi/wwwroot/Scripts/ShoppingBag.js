const loadShoppingBagPage = () => {
    const bagItems = sessionStorage.getItem("productArray");
    const jsonBagItems = JSON.parse(bagItems);
    console.log(jsonBagItems);
    showBagItems(jsonBagItems);
}

const showBagItems = (bagItems) => {
    let sum = 0;
    console.log(bagItems);
    const template = document.getElementById("temp-row").content;
    const tbody = document.querySelector("tbody");
    tbody.replaceChildren();
    const prodId = [];
    bagItems.forEach(item => {
        if (prodId.includes(item.id)) {
            const prod = document.getElementById(item.id);
            const quantityDiv = prod.querySelector('.quantity').innerHTML++;
            console.log(quantityDiv);
        }
        else {
            const clone = template.cloneNode(true);
            const image = clone.querySelector(".image");
            const itemName = clone.querySelector(".itemName");
            const itemNumber = clone.querySelector(".itemNumber");
            clone.querySelector("tr").id = item.id;
            prodId.push(item.id);

            image.src = "./Images/" + item.prodImage;
            itemName.innerText = item.prodName;
            itemNumber.innerText += " " + item.price;
            tbody.appendChild(clone);
        } 
        sum += item.price;
    })
    document.getElementById("itemCount").innerHTML = bagItems.length;
    document.getElementById("totalAmount").innerHTML = sum ;
}

const deleteProd = () => {    
    const deleteButton = event.target;
    const row = deleteButton.closest('.item-row'); 
    const rowId = row.id;
    console.log('Clicked on delete button of row with ID:', rowId);
    const itemsBag = JSON.parse(sessionStorage.getItem("productArray"));
    const prod = itemsBag.filter(prod => prod.id !== parseInt(rowId));
    sessionStorage.setItem("productArray", JSON.stringify(prod));
    showBagItems(prod);    
}