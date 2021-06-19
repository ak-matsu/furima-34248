const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    // e.preventDefault();
    console.log("フォーム送信時にイベント発火")

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    
    const card = {
      number: formData.get("addressbook[number]"),
      cvc: formData.get("addressbook[cvc]"),
      exp_month: formData.get("addressbook[exp_month]"),
      exp_year: `20${formData.get("addressbook[exp_year]")}`,
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
      document.getElementById("addressbook_number").removeAttribute("name");
      document.getElementById("addressbook_cvc").removeAttribute("name");
      document.getElementById("addressbook_exp_month").removeAttribute("name");
      document.getElementById("addressbook_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();

    });
  });
};

window.addEventListener("load", pay);