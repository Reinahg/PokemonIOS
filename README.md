# PokemonIOS

Resumen ejecutivo:
Este proyecto consume la api de https://pokeapi.co/api/v2/pokemon para mostrar información de diferentes pokemones y asi demostrar mi conocimiento actual en IOS

Requisitos del proyecto:
El proyecto fue creado en Xcode 15.0 y la versión minima de ios para ejecutar es de 16.0. Para poder ejecutar el proyecto es necesario hacer el pod install y abrir el archivo Pokemons.xcworkspace para que se ejecute correctamente 

Arquitectura general:
Se implementó un MVVM, separando las capas de Model, ViewModel, ApiService, y Controlador

Tecnologías utilizadas:
Se utilizó Swift con Storyboards, para las pruebas unitarias se usó XCTests y se usaron las librerias de alamofire para el consumo de servicios, el SDWebImage para mostrar las imagenes de la web y finalmente ProgressHUD para mostrar indicadores de carga con animaciones
