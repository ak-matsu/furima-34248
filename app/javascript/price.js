window.addEventListener('load', function(){

  // ★価格
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);

      // ★販売手数料
      const addTaxDom = document.getElementById("add-tax-price");

      // 入力した金額をもとに販売手数料を計算する処理
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
      
      // ★販売利益
      const profitDom = document.getElementById("profit");

      // 入力した金額をもとに販売利益を計算する処理
      profitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
      
  })
})
