function item () {
  const priceinput = document.getElementById("item-price");
  const price_tax = document.getElementById("add-tax-price");
  const price_profit = document.getElementById("profit");

  priceinput.addEventListener("keyup", () => { 
    const value = priceinput.value;
let tax = Math.round(value / 10);
price_tax.innerHTML = tax
price_profit.innerHTML = value - tax
  });
}

window.addEventListener("load", item);
