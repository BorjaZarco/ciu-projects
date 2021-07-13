# Practica 6 - Procesamiento de vídeo

**Hecho por Borja Zarco Cerezo**

## Índice
- [Introducción](#introducción) 
- [Desarrollo](#desarrollo)
- [Uso](#uso)
- [Resultado](#resultado)
- [Referencias](#referencias)

## Introducción

El objetivo de esta práctica consiste en la elaboración de diferentes filtros sobre una captura de video.

## Desarrollo

El objetivo original era la elaboración de dos filtros: uno en blanco y negro y otro en el que se mostrara una sucesión de filtros de color. El primer filtro quiere dar una sensación de tristeza al usuario, mientras que el segundo simula el ambiente de una discoteca. Con ello se pretende que el segundo filtro de una sensación opuesta al primero: jolgorio y alegría propias de un ambiente festivo. Ambos efectos tienen un efecto de sonido para reforzar la impresión que han de dar.

La aplicación, además, determina qué filtro mostrar. Esto lo hace mediante la detección de caras y, en concreto, de la sonrisa. Si se detecta la sonrisa se muestra el filtro de discoteca y si no se detecta, el filtro "triste". Es posible que debido a falsos positivos o falsos negativos por parte de la librería de OpenCV haya cambios de modo indeseados.Se ha intentado ajustar los umbrales lo máximo posible.

## Uso

Para cambiar de modo hay que sonreir (para pasar al modo feliz) o no (para pasar al modo triste). La aplicación puede tener ciertos problemas por detecciones erróneas.

## Resultado

Aqui dejo una demo de la aplicación resultante: 

![Demo Aplicación](./assets/video-animation.gif)

## Referencias

* [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
* [GifAnimation](https://github.com/extrapixel/gif-animation)
* [Documentación Processing](https://processing.org/)
* [Disco sound Effect](http://www.orangefreesounds.com/disco-beat/)
* [Sad Song](soundboard.com/sb/sound/981956)
