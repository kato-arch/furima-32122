window.addEventListener("DOMContentLoaded", () => {
  // 現在ページのURLのパス名を取得
  const path = location.pathname
  // 商品編集画面
  const pathRegex = /^(?=.*item)(?=.*edit)/
  // 商品出品画面または、商品編集画面の場合
  if (path === "/items/new" || path === "/items" || pathRegex.test(path)) {

     // 価格
    const priceInput = document.getElementById("item-price");
    // 販売手数料
    const addTaxDom = document.getElementById("add-tax-price");
    // 販売利益
    const profitDom = document.getElementById("profit");

     // 価格を入力した場合
    priceInput.addEventListener("input", () => {
      // 価格の入力値を取得
      const inputValue = document.getElementById("item-price").value;
      // 販売手数料を計算：(価格*0.1)で小数点切り捨て
        let tax = Math.floor(inputValue * 0.1)
        addTaxDom.innerHTML = tax ;
        // 販売利益を計算：価格ー販売手数料
        profitDom.innerHTML = (inputValue - tax)
    })
  }
});