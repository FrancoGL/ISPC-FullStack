let btnPrev = document.getElementById("prev");
let btnNext = document.getElementById("next");
let image = document.getElementById("c-img")
let number = 1

function nextHandler(){

    if (number < 4){
        number += 1;
        image.src=`/front-end/assets/img/details${number}.jpg`
    } 
}
function prevHandler(){
    if (number > 0 && number != 1){
        number -= 1;
        image.src=`/front-end/assets/img/details${number}.jpg`
    }
}

btnPrev.onclick = prevHandler;
btnNext.onclick = nextHandler;