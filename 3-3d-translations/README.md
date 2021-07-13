# Practica 3 - Traslaciones 3D

**Hecho por Borja Zarco Cerezo**

## Índice
- [Introducción](#introducción) 
- [Desarrollo](#desarrollo)
    - [Cuerpos Celestes](##cuerpos-celestes)
    - [Posibles Mejoras](##posibles-mejoras)
- [Resultado](#resultado)
- [Referencias](#referencias)

## Introducción

El objetivo de esta práctica consiste en crear un prototipo que muestre un sistema planetario en movimiento que incluya una estrella, al menos cinco planetas y alguna luna, integrando primitivas 3D, texto e imágenes. Se ha elegido realizar una representación del sistema solar.

## Desarrollo

El resultado del desarrollo es una representación que se asemeja bastante al sistema solar en la realidad. Se han tenido que modificar los tamaños de los cuerpos celestes puesto que eran muy dispares, dificultando la visibilidad de algunos cuerpos. Las velocidades de rotación son, sin embargo, bastante realistas. 

Además se han tenido que eliminar algunos planetas del sistema solar pues no se podían apreciar en pantalla ya que se salían de la misma.

## Cuerpos Celestes

Para el dibujo de los cuerpos celestes se han utilizado tres tipos de clases: `Star`, `Planet`, `Satellite`. Estas tres clases bien podrían heredar de una clase `Celestial Body` pues tienen muchas características similares. Todas ellas contenían al menos el nombre y la figura, que sería rotada y trasladada al pintarla usando el método `repaint`. Este método también sería el encargado de pintar los cuerpos celestes que orbitan a su alrededor. Esta supuesta clase padre quedaría de la siguiente manera:

```java
class CelestialBody {
    String name;    
    PShape planet;
    ArrayList<CelestialBody> satellites;

    public void repaint();
    public void addCelestialBody();
}
```


Desde el `setup` se crean los distintos cuerpos celestiales que se van a mostrar.  

## Posibles mejoras

En un punto del desarrollo se decidió mostrar carteles debajo de cada cuerpo celeste a modo de etiqueta que indicaría el nombre de dicho cuerpo. Sin embargo se desestimó esa opción por motivos estéticos ya que algunos carteles se pisaban con algunos planetas. 

Como posible mejora, se podrían incluir el resto de planetas en una representación más fidedigna de la realidad. Esto se ha dejado precisamente pendiente para la versión 2 en la que se va a incluir a un sujeto cámara. Esto permitirá que se aprecien los objetos que en un primer momento queden fuera de la vista y que serían imposibles de mostrar usando una cámara fija, como en el caso actual.

## Resultado

Aqui dejo una demo de la aplicación resultante: 

![Demo Aplicación](./assets/planetarium-animation.gif)

## Referencias

* [Guion de prácticas](https://cv-aep.ulpgc.es/cv/ulpgctp20/pluginfile.php/126724/mod_resource/content/22/CIU_Pr_cticas.pdf)
* [GifAnimation](https://github.com/extrapixel/gif-animation)
* [Documentación Processing](https://processing.org/)
* [Datos del Sistema Solar](https://nssdc.gsfc.nasa.gov/planetary/factsheet/)
* [Texturas espaciales](https://www.solarsystemscope.com/textures/)
* [Compresor de imágenes](https://resizeimage.net/)
