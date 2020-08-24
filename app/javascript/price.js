window.addEventListener('load', function(){
  
  const inputPrice = document.getElementById("item-price")
  const outputTax =  document.getElementById("add-tax-price")
  const outputProfit =  document.getElementById("profit")

  inputPrice.addEventListener('change', function(){
    outputTax.innerHTML = Math.floor(inputPrice.value * 0.1)
    outputProfit.innerHTML = inputPrice.value - outputTax.innerHTML
  })

})