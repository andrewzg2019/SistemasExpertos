(deftemplate persona
	(slot nombre (type SYMBOL))
 	(slot edad (type INTEGER) (range 1 99))
)
(defrule ingresar
	(initial-fact)
	=>
	(printout t "Nombre de Persona: ")
	(bind ?nombre (read))
	(printout t "Edad de la Persona: ")
	(bind ?edad (read))
	(assert (persona (nombre ?nombre)(edad ?edad)))
)

(defrule nino
	(persona (nombre ?nombre)(edad ?edad))
	(test (<= ?edad 10))
	=>
	(printout t ?nombre", es un niño" crlf)
)
(defrule joven
	(persona (nombre ?nombre)(edad ?edad))
	(test (and(<= ?edad 18)(> ?edad 10)))
	=>
	(printout t ?nombre", es un joven" crlf)
)
(defrule adulto
	(persona (nombre ?nombre)(edad ?edad))
	(test (and(<= ?edad 65)(> ?edad 18)))
	=>
	(printout t ?nombre", es un adulto" crlf)
)
(defrule adulto-mayor
	(persona (nombre ?nombre)(edad ?edad))
	(test (> ?edad 65))
	=>
	(printout t ?nombre", es un adulto mayor" crlf)
)