# MVP + Coordinators
Ejemplo de implementación de un proyecto con arquitectura Modelo-Vista-Presentador (MVP) y coordinators.

## Descripción
En este proyecto se obtiene una lista de países desde una URL, la cual se generó usando un mock server de Postman. Cuando el usuario selecciona un país, se agrega un ícono en la celda para mostrar la fila seleccionada y se muestra una alerta con el nombre del país.

Los view controllers, las vistas y los constraints se hicieron en código, el storyboard inicial fue eliminado.

## Arquitectura
El proyecto se estructuró con la arquitectura Modelo - Vista - Presentador (MVP).

Para controlar la navegación dentro de la app se utilizan coordinators, ya que permiten extraer la lógica de navegación del view controller. De este modo, el view controller solo contiene código para mostrar los elementos de la interfaz y responder a las interacciones del usuario.

El proyecto solo contiene 2 módulos: uno para mostrar la lista de países disponibles y otro que muestra una alerta personalizada con el nombre del país seleccionado. Ambos módulos se encuentran dentro de la carpeta *Modules*. 

El módulo *Countries* contiene carpetas para los distintos componentes de la arquitectura MVP y el coordinator del módulo. Para el módulo *SelectedModal* no se incluyeron clases relativas al modelo ni al presentador, ya que su funcionalidad es muy simple y solo consiste en mostrar información. De la misma manera, el módulo no contiene coordinator y es presentado directamente desde el coordinator de Países.

El consumo de la URL con los datos de los países se encapsuló en la clase "CountriesService.swift", que se llama desde el presenter del módulo de países, para poder obtener la información. De este modo, se aisla la lógica del consumo de la URL, la validación del contenido de la respuesta y la lectura del JSON con la información en esta clase. Así, podríamos obtener la información, desde cualquier otro módulo del proyecto, sin tener que duplicar el código con esa lógica.

## To do
- Inyectar las dependencias necesarias para la inicialización de los módulos desde el coordinator.