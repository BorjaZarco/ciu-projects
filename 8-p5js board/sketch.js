const brush = {
    color: [0, 0, 0],
    width: 20
}

const rubber = {
    color: [255, 255, 255],
    width: 10
}

let eraser = false;
let p5ColorPicker;


document.addEventListener("DOMContentLoaded", (event) => {
    const colorIcon = document.getElementById('color-icon');
    const brushIcon = document.getElementById('brush-icon');
    const saveButton = document.getElementById('button-save');
    const strokeButton = document.getElementById('button-brush');
    const colorButton = document.getElementById('button-color');
    const rubberButton = document.getElementById('button-rubber');
    const wipeButton = document.getElementById('button-wipe');

    strokeButton.addEventListener('click', () => {
        if (eraser) {
            rubber.width = (rubber.width >= 40) ? 1 : rubber.width + 10;
            brushIcon.style.width = `${rubber.width}px`
            brushIcon.style.height = `${rubber.width}px`
        } else {
            brush.width = (brush.width >= 40) ? 1 : brush.width + 10;
            brushIcon.style.width = `${brush.width}px`
            brushIcon.style.height = `${brush.width}px`
        }
    })

    colorButton.addEventListener('click', () => {
        if (eraser) { return; }
        const colorPicker = document.getElementById('color-picker');
        colorPicker.click()
    })

    rubberButton.addEventListener('click', () => {
        eraser = !eraser;

        if (eraser) {
            cursor("/assets/eraser.png");
            brushIcon.style.backgroundColor = `rgb(${rubber.color.join(',')})`
            colorIcon.style.backgroundColor = `rgb(${rubber.color.join(',')})`
            brushIcon.style.width = `${rubber.width}px`
            brushIcon.style.height = `${rubber.width}px`
            rubberButton.classList.add('active')
        } else {
            cursor("/assets/pencil.png");
            colorIcon.style.backgroundColor = `rgb(${brush.color.join(',')})`
            brushIcon.style.backgroundColor = `rgb(0, 0, 0)`
            brushIcon.style.width = `${brush.width}px`
            brushIcon.style.height = `${brush.width}px`
            rubberButton.classList.remove('active')

        }
    })

    wipeButton.addEventListener('click', () => {
        this.clearBackground();
    })

    saveButton.addEventListener('click', () => {
        saveCanvas('canvas');
    })
});

function setColor() {
    const colorIcon = document.getElementById('color-icon');
    const newColor = p5ColorPicker.color().levels;
    brush.color = newColor;
    colorIcon.style.backgroundColor = `rgb(${brush.color.join(',')})`

}


function setup() {
    const canvas = createCanvas(windowWidth - 95, windowHeight);
    canvas.position(95, 0)
    background(255);

    cursor("/assets/pencil.png")

    p5ColorPicker = createColorPicker(`rgb(${brush.color.join(',')})`);
    p5ColorPicker.id('color-picker');
}

function draw() { }

function mouseDragged() {
    if (!eraser) {
        stroke(...brush.color);
        strokeWeight(brush.width);
    } else {
        stroke(...rubber.color);
        strokeWeight(rubber.width);
    }
    line(mouseX, mouseY, pmouseX, pmouseY);
}

function clearBackground() {
    background(255);
}

setTimeout(() => {
    const colorPicker = document.getElementById('color-picker');
    colorPicker.addEventListener('change', () => {
        this.setColor()
    })
}, 1000);