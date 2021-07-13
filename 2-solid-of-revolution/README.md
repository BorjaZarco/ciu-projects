# Practica 2 - Generación de Sólido de Revolución

**Hecho por Borja Zarco Cerezo**

## Índice
- [Introducción](#introducción) 
- [Desarrollo](#desarrollo)
    - [Proyecto base](##proyecto-base)
    - [Dibujo 2D](##dibujo-2d)
    - [Dibujo 3D](##dibujo-3d)
- [Uso](#uso)
    - [Pantalla Dibujo 2D](##pantalla-dibujo-2d)
    - [Pantalla Visualización 3D](##pantalla-visualización-3d)
- [Resultado](#resultado)
- [Referencias](#referencias)

## Introducción

El objetivo de esta práctica consiste en crear un prototipo que recoja puntos. La unión de estos puntos forman el perfil de una figura que se va a generar a continuación. A partir de dicho perfil se ha de generar, por tanto, un sólido de revolución, obteniendo y mostrando al usuario un objeto tridimensional. La geometría resultante se almacenará en una variable de tipo PShape propia de Processing. El prototipo permitirá crear sólidos de revolución de forma sucesiva, si bien únicamente se asumirá
necesario almacenar y mostrar el último definido.

## Desarrollo

Se han desarrollado varias funcionalidades extra a partir del proyecto base. 

### Proyecto base

Para el dibujo de la figura en tres dimensiones a partir de un perfil se ha utilizado un algoritmo muy sencillo para la rotación de puntos. Este algoritmo se ha aplicado a todos los puntos que forman dicho perfil y para un número de rotaciones, en concreto de 0 a 2π con un *step* de π/4.


```
*x2 = x1 · cosθ − z1 ·senθ*

*y2 = y1*

*z2 = x1 ·senθ + z1 · cosθ*
```

Este algoritmo genera una lista de puntos rotados y trasladados pues se decidió que la figura estuviera centrada en la pantalla de la aplicación. Para ello se aplicó una traslación en el eje X y otra en el eje Y mientras se iban generando los puntos rotados.

El algoritmo quedó de la siguiente manera:

```java
this.angle = QUARTER_PI;
for (int i = 0; i < points.size() - 1; i++) {
    for (int step = 0; step <= 8 ; step++ ) {
        Point p = points.get(i);
        Point nextP = points.get(i+1);

        points3D.add(new Point(
            (p.x - width/2) * cos(angle * step) - p.z * sin(angle * step) + width/2,
            p.y - minHeight + height/2 - figHeight / 2,
            (p.x - width/2) * sin(angle * step) + p.z * cos(angle * step)
        ));
        points3D.add(new Point(
            (nextP.x - width/2) * cos(angle * step) - nextP.z * sin(angle * step) + width/2,
            nextP.y - minHeight + height/2 - figHeight / 2,
            (nextP.x - width/2) * sin(angle * step) + nextP.z * cos(angle * step)
        ));
    }
}
```

Por cuestiones de como processing dibujaba la figura, los puntos se fueron generando por parejas. 

### Dibujo 2D

En primer lugar, dado que lo que se espera que dibuje el usuario en la pantalla sea el perfil de la figura vista de frente se entendió que lo mejor era que dibujara en una mitad de la pantalla. De esta manera, el perfil se rotaría en torno a un eje central en la pantalla, siendo mas sencillo para el usuario dibujar la figura que desee. Se consideró, por tanto, que esto daba más control y facilidades al usuario en cuanto al dibujo.

Como añadido, al usuario se le permite poder borrar todos los puntos en la pantalla por si quiere rehacer la figura pulsando una única tecla. Incluso, si comete un error y establece de forma errónea un punto, se le permite borrar el mismo al pulsar otra tecla. Todo esto se ha hecho en pos de que el usuario tenga un mayor control sobre lo que dibuja y pueda corregir los errores lo más rápido y sencillo posible. 

### Dibujo 3D

Se han añadido tres funcionalidades extra en cuanto a la figura 3D. Se le permite al usuario rotar, desplazar y acercar o alejar la figura usando diferentes comandos. 

Si bien es verdad, por problemas que todavía se desconocen, no se ha llegado a desarrollar el rotar como se desea, es decir, lograr que la figura rote sobre su eje. 

Por último, se le permite al usuario volver a la pantalla de dibujo presionando el botón ENTER por si quiere realizar varias figuras.

## Uso

### Pantalla Dibujo 2D

Nada más iniciar la aplicación se le muestra lo que se conoce como pantalla de dibujo 2D. En ella se permite dibujar al usuario una figura. Para ello ha de hacer click derecho sobre la mitad derecha de la pantalla para ir estableciendo los diferentes vértices de la misma. 

> NOTA: si se hace click en la mitad izquierda de la pantalla **se dibujará un punto en el eje central de la pantalla a la misma altura** a la que se hizo el click.

Comandos Pantalla Dibujo 2D:

* `ENTER` - genera la figura en 3D y pasa a la pantalla de visualización de la figura.
* `N` - Borra la zona de dibujo, eliminando todos los puntos establecidos.
* `DELETE` - Elimina el último punto dibujado.

### Pantalla Visualización 3D

Una vez se genera la figura, se pasa a la pantalla de visualizacion del sólido de revolución.

Comandos Pantalla Visualizacion 3D:

* `ENTER` - volver a la pantalla de dibujo 2D.
* `ARROW KEYS` - Rota la figura sobre dos ejes: horizontal (arriba/abajo) y vertical (derecha/izquierda).
* `SCROLL` - Acerca o aleja la figura.
* `CLICK IZQUIERDO + ARRASTRAR` - Mover la figura.



## Resultado

Aqui dejo una demo de la aplicación resultante: 

![Demo Aplicación](./assets/autocad-animation.gif)

## Referencias

* [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
* [GifAnimation](https://github.com/extrapixel/gif-animation)
* [Documentación Processing](https://processing.org/)