const loadProductPage = async () => {
    const categories = await getCategories();
    showCategories(categories);
    const products = await getProducts();
    showProducts(products);
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

const getProducts = async () => {
    try {
        const res = await fetch(`/api/products`,
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