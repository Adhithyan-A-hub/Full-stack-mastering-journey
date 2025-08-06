document.addEventListener('DOMContentLoaded', function () {
    const input1 = document.getElementById("inp1");
    const input2 = document.getElementById("inp2");
    const result = document.getElementById("rslt");
    const add = document.getElementById("add");
    const subt = document.getElementById("sub");
    const mult = document.getElementById("mult");
    const divs = document.getElementById("divs");

    add.addEventListener('click', () => {
        let rslt = Number(input1.value) + Number(input2.value);
        result.textContent = rslt;
    });

    subt.addEventListener('click', () => {
        let rslt = Number(input1.value) - Number(input2.value);
        result.textContent = rslt;
    });

    mult.addEventListener('click', () => {
        let rslt = Number(input1.value) * Number(input2.value);
        result.textContent = rslt;
    });

    divs.addEventListener('click', () => {
        let num2 = Number(input2.value);
        if (num2 === 0) {
            result.textContent = "Cannot divide by zero";
            result.style.left = "7rem";
            result.style.width = "23rem";
        } else {
            let rslt = Number(input1.value) / num2;
            result.textContent = rslt;
        }
    });
});
