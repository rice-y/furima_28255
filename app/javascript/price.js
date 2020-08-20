// console.log("aaa")
window.addEventListener("DOMContentLoaded", ()=> {
    var t = location.pathname;
    
    if ("/items/new" === t || "/items" === t || /^(?=.*item)(?=.*edit)/.test(t)) {
        var e = document.getElementById("item-price");
        var n = document.getElementById("add-tax-price");
        var r = document.getElementById("profit");
          
        e.addEventListener("input",()=> {
            var t = document.getElementById("item-price").value;
            n.innerHTML = Math.floor(.1 * t).toLocaleString();
            r.innerHTML = Math.floor(.9 * t).toLocaleString();
        })
    }
})
