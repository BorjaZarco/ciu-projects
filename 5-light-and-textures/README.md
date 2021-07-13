# Practica 5 - Iluminación y texturas

**Hecho por Borja Zarco Cerezo**

## Índice
- [Introducción](#introducción) 
- [Desarrollo](#desarrollo)
- [Uso](#uso)
- [Resultado](#resultado)
- [Referencias](#referencias)

## Introducción

El objetivo de esta práctica consiste en permitir la navegación por un sistema con textura, así como su iluminación por algún método escogido.
## Desarrollo

Se ha implementado un desarrollo simple de una supuesta habitación en la que las paredes tienen una textura semejante al típico gotelé de las casas españolas y en la que el cuerpo que actúa de cámara es el emisor de luz. Por ello, cuanto más cerca se encuentre este cuerpo de una pared, más iluminada estará la misma. Además, se permite al usuario cambiar la intensidad y el color de la luz que desprende el cuerpo observador. 

## Uso

* `Click Izdo y Arrastrar el Ratón ` - Desplaza la dirección de visión
* `TAB` - Cambia el color de la luz
* `A` - Mueve el cuerpo observador hacia la izquierda por el eje X.
* `D` - Mueve el cuerpo observador hacia la derecha por el eje X.
* `S` - Mueve el cuerpo observador hacia atrás por el eje Z.
* `W` - Mueve el cuerpo observador hacia delante por el eje Z.
* `Q` - Disminuye la intensidad de la luz.
* `E` - Aumenta la intensidad de la luz.


## Resultado

Aqui dejo una demo de la aplicación resultante: 

![Demo Aplicación](./assets/gotele-animation.gif)

## Referencias

* [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
* [GifAnimation](https://github.com/extrapixel/gif-animation)
* [Documentación Processing](https://processing.org/)
* [Texturas espaciales](https://www.hogarmania.com/archivos/201105/brico-0644-eliminar-gotele-xl-848x477x80xX.jpg)