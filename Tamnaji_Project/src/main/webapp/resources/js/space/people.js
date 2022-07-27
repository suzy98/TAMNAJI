let options2 = document.getElementById("options-2");
let optionList2 = ["7명이상", "6명", "5", "4", "3", "2", "1"];  
let isOpen2 = false;

options2.addEventListener("click", addToUIOptions2);

function addToUIOptions2(e) {
    if (e.target.classList.contains("hide-option-2")) {
        controlOptions2(e);
    }
    else {
        const pickedOption2 = e.target;

        if (options2.firstElementChild.classList.contains("hide-option-2")) {
            options2.removeChild(options2.firstElementChild);
        }
        options2.insertAdjacentElement("afterbegin", pickedOption2);

        deleteOptions2();
        controlOptions2(e);
    }
}

function controlOptions2(e) {
    if (isOpen2 === false) {
        createOptions2();
        options2.classList.add("opened");
        isOpen2 = true;
    }
    else {
        deleteOptions2();
        options2.classList.remove("opened");
        isOpen2 = false;
    }
}

function deleteOptions2() {
    while (options2.childElementCount > 1) {
        options2.removeChild(options2.lastElementChild);
    }
}

function createOptions2() {
    optionList2.forEach(element => {
        if (options2.firstElementChild.textContent !== element) {
            let option2 = document.createElement("div");
            option2.className = "option2";
            option2.textContent = element;
            options2.firstElementChild.insertAdjacentElement("afterend", option2);
        }
    });
};