# MVP + Coordinators
Ejemplo de implementación de un proyecto con arquitectura Modelo-Vista-Presentador (MVP) y coordinators.

## Descripción
En este proyecto se obtiene una lista de países desde una URL, la cual se generó usando un mock server de Postman. Cuando el usuario selecciona un país, se agrega un ícono en la celda para mostrar la fila seleccionada y se muestra una alerta con el nombre del país.

Los view controllers, las vistas y los constraints se hicieron en código, el storyboard inicial fue eliminado.

## Arquitectura
El proyecto se estructuró con la arquitectura Modelo - Vista - Presentador (MVP) + Coordinators.

El proyecto solo contiene 2 módulos: uno para mostrar la lista de países disponibles y otro que muestra una alerta personalizada con el nombre del país seleccionado. Ambos módulos se encuentran dentro de la carpeta *Modules*.

Para controlar la navegación dentro de la app se utilizan coordinators, ya que estos permiten extraer la lógica de navegación del view controller. De este modo, el view controller solo contiene código para mostrar los elementos de la interfaz y responder a las interacciones del usuario.

El módulo *Countries* contiene carpetas para los distintos componentes de la arquitectura MVP y el coordinator del módulo. Para el módulo *SelectedModal* no se incluyeron clases relativas al modelo ni al presentador, ya que su funcionalidad es muy simple y solo consiste en mostrar información. De la misma manera, el módulo no contiene coordinator y es presentado directamente desde el coordinator de Países.

La lógica para obtener la lista de países se encuentra en la carpeta *Repository*. En *CountriesRepository.swift* se definió el protocolo que deben implementar las clases para obtener la lista de países. La clase *CountriesAPIRepository.swift* implementa dicho protocolo y contiene la lógica para leer la lista de países desde el endpoint creado en Postman. La clase *MockCountriesRepository.swift* implementa el mismo protocolo, pero en ella se crea de manera local una lista de países que se devuelve inmediatamente. Se puede cambiar entre una y otra implementación del protocolo según se necesite.

Por último, el coordinator de países es donde se inicializan todas las dependencias necesarias para que el módulo funcione. Las dependencias se inyectan en las clases que las requieran.