# language:es
@search-spanish @javascript @api
Característica: Como usuaria anónima
                Debería poder realizar
                búsqueda básica

  Escenario: Como usuario final, se me debe presentar el mensaje adecuado si busco sin ingresar la palabra clave.
    Dadas estoy en "/es"
    Entonces debo ver "Buscar"
    Y relleno "Buscar por palabra clave, ingrediente, plato" con ""
    Y presiono "Buscar"
    Entonces debo ver texto que siga el patrón "Por favor, escriba algunas palabras clave."


  Escenario: Como usuario anónimo, se me debería presentar el mensaje adecuado si busco con una palabra clave de menos de 3 caracteres.
    Dadas estoy en "/es"
    Entonces debo ver "Buscar"
    Y relleno "Buscar por palabra clave, ingrediente, plato" con "s"
    Y presiono "Buscar"
    Entonces debo ver texto que siga el patrón "Debe incluir al menos una palabra clave para que coincida en el contenido. Palabras clave deben tener al menos 3 caracteres y la puntuación es ignorada."



  Escenario:  Como usuario anónimo, se me debería presentar la paginación si el término de búsqueda tiene más resultados.
    Dadas estoy en "/es"
    Entonces debo ver "Buscar"
    Y relleno "Buscar por palabra clave, ingrediente, plato" con "s"
    Y presiono "Buscar"
    Entonces debo ver "1"
    Y debo ver "2"



