//ページが読み込まれた後に関数が実行される
window.addEventListener('load', function(){
  
  const inputPrice = document.getElementById("item-price")
  const outputTax =  document.getElementById("add-tax-price")
  const outputProfit =  document.getElementById("profit")

  //価格入力の値がchangeした時にイベント発火
  inputPrice.addEventListener('change', function(){
    outputTax.innerHTML = Math.floor(inputPrice.value * 0.1)
    outputProfit.innerHTML = inputPrice.value - outputTax.innerHTML
  })

})