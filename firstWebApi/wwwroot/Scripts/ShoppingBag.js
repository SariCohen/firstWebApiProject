const loadShoppingBagPage = () => {
    const bagItems = sessionStorage.getItem("productArray");
    const jsonBagItems = JSON.parse(bagItems);
    console.log(jsonBagItems);
    showBagItems(jsonBagItems);
}

const showBagItems = (bagItems) => {
    console.log(bagItems);
    const template = document.getElementById("temp-row").content;
    const tbody = document.querySelector("tbody");
    const prodArray = bagItems;
    bagItems.forEach(item => {
        const clone = template.cloneNode(true);
        const image = clone.querySelector(".image");
        const itemName = clone.querySelector(".itemName");
        const itemNumber = clone.querySelector(".itemNumber");
        const quantity = clone.querySelector(".quantityColumn");

        image.src = "./Images/" + item.prodImage;
        itemName.innerText = item.prodName;
        itemNumber.innerText = item.price ;
        tbody.appendChild(clone);
    })
}