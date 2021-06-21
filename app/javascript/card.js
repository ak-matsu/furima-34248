const pay = () => {
  console.log("フォーム送信時にイベント発火")


  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    // e.preventDefault();
 

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    
    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
      document.getElementById("order_address_number").removeAttribute("name");
      document.getElementById("order_address_cvc").removeAttribute("name");
      document.getElementById("order_address_exp_month").removeAttribute("name");
      document.getElementById("order_address_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();

    });
  });

  console.log(card)
  console.log(token)
};

window.addEventListener("load", pay);