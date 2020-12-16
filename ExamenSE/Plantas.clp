(defrule pregunta1
(respuesta1 si)
=>
(assert (planta-crece-poco))
)

(defrule pregunta2
(respuesta2 si)
=>
(assert (planta-color-amarillo-palido))
)

(defrule pregunta3
(respuesta3 si)
=>
(assert (hojas-color-pardo-rojizo))
)

(defrule pregunta4
(respuesta4 si)
=>
(assert (raiz-crece-poco))
)

(defrule pregunta5
(respuesta5 si)
=>
(assert (planta-tallo-fusiforme))
)

(defrule pregunta6
(respuesta6 si)
=>
(assert (planta-color-purpura))
)

(defrule pregunta7
(respuesta7 si)
=>
(assert (planta-retraso-madurez))
)

(defrule respuesta8
(respuesta8 si)
=>
(assert (bordes-hojas-chamuscados))
)

(defrule pregunta9
(respuesta9 si)
=>
(assert (planta-tallos-debilitados))
)

(defrule pregunta10
(respuesta10 si)
=>
(assert (semillas-frutas-marchitas))
)

(defrule ausencia-nitrogeno
(or(planta-crece-poco)(planta-color-amarillo)(hojas-color-pardo-rojizo))
=>
(assert(no-nitrogeno))
(printout t "La planta carece de Nitrógeno." crlf)
)

(defrule ausencia-fosforo
(or(raiz-crece-poco)(planta-tallo-fusiforme)(planta-color-purpura)(planta-retraso-madurez))
=>
(assert(no-fosforo))
(printout t "La planta carece de Fósforo." crlf)
)

(defrule ausencia-potasio
(or(bordes-hojas-chamuscados)(planta-tallos-debilitados)(semillas-frutas-marchitas))
=>
(assert(no-potasio))
(printout t "La planta carece de Potasio." crlf)
)
