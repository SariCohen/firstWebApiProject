const loadProductPage = async () => {
    const categories = await getCategories();
    showCategories(categories);
    const products = await getProducts("");
    showProducts(products);
}

const filter = (id) => {
    const checkbox = document.getElementById(id);
    if (checkbox.checked)
        console.log(id);
}

const getCategories = async () => {
    try {
        const res = await fetch(`/api/categories`,
            {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            });

        if (!res.ok)
            throw new Error("No Categories Found")
        const categories = await res.json();
        return categories;
    }
    catch (ex) {
        alert(ex.message)
    }
}

const showCategories = (categories) => {
    const template = document.getElementById("temp-category").content;
    const categoryList = document.getElementById("categoryList");
    categories.forEach(category => {
        const clone = template.cloneNode(true);
        const checkbox = clone.querySelector(".opt");
        const label = clone.querySelector("label");
        const optionName = clone.querySelector(".OptionName");
           
        checkbox.id = category.id;
        checkbox.value = category.id;
        label.setAttribute("for", category.id);
        optionName.textContent = category.categoryName;
            
        categoryList.appendChild(clone);
    });    
} 

const getProducts = async (url) => {
    try {
        const res = await fetch(`/api/products` + url,
            {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            });

        if (!res.ok)
            throw new Error("No Products Found")
        const products = await res.json();
        return products;
    }
    catch (ex) {
        alert(ex.message)
    }
}

const showProducts = (products) => {
    const template = document.getElementById("temp-card").content;
    const PoductList = document.getElementById("PoductList");
    console.log(products);
    products.forEach(product => {
        const clone = template.cloneNode(true);
        const image = clone.querySelector("img");
        const h1 = clone.querySelector("h1");
        const price = clone.querySelector(".price");
        const description = clone.querySelector(".description");

        image.src = "./Images/" + product.prodImage;
        h1.textContent = product.prodName;
        price.textContent = product.price + " ₪";
        description.textContent = product.prodDescription;
        ;
        
        PoductList.appendChild(clone);
    });
    const counter = document.getElementById("counter");
    counter.innerHTML = products.length;
} 