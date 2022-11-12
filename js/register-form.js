const $btn = document.getElementById("btn-register");
const $nameInput = document.getElementById("name");
const $emailInput = document.getElementById("mail");
const $passwordInput = document.getElementById("password");
const $passwordRepeatInput = document.getElementById("password_repeat");
const $telInput = document.getElementById("tel");

document.addEventListener("submit", (e) => {
  e.preventDefault();
});

document.addEventListener("input", (e) => {
  if (
    $nameInput.validity.valid  &&
    $emailInput.validity.valid  &&
    $passwordInput.validity.valid  &&
    $passwordRepeatInput.validity.valid  &&
    $telInput.validity.valid 
  ) {
    $btn.setAttribute("data-bs-toggle", "modal");
  }
});