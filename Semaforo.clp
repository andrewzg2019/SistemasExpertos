(defrule tipo-robot-regla
(initial-fact)
=>
(printout t "Que tipo de robot/configuracion tienes (peaton/carro)? " crlf)
(assert (tipo-robot (read)))
)

(defrule semaforo-color-regla
(or  (tipo-robot peaton) (tipo-robot carro))
=>
(printout t "Ingrese color del semaforo (rojo/verde/amarillo)?" crlf)
(assert (semaforo (read)))
)

(defrule pasar-regla
(tipo-robot ?tipo)
(or (and (tipo-robot carro) (semaforo verde)) (and (tipo-robot peaton) (semaforo rojo)))
=>
(printout t "El robot " ?tipo " puede pasar" crlf)
)

(defrule precaucion-regla
(tipo-robot ?tipo)
(semaforo amarillo)
=>
(printout t "El robot " ?tipo " pasar rapido!!" crlf)
)

(defrule detener-regla
(tipo-robot ?tipo)
(or (and (tipo-robot carro) (semaforo rojo)) (and (tipo-robot peaton) (semaforo verde)))
=>
(printout t "El robot " ?tipo " no puede pasar, debe esperar" crlf)
)