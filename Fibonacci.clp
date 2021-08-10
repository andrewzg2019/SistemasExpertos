(deffunction fibonacci (?n)
	(bind ?a 0)
	(bind ?b 1)
	(printout t ?a crlf)
	(printout t ?b crlf)
	(loop-for-count(?i 1 (- ?n 2))
	(bind ?c (+ ?a ?b))
	(printout t ?c crlf)
	(bind ?a ?b)
	(bind ?b ?c)
)

)

(defrule inicio
	(initial-fact)
	=>
	(printout t "Ingrese la cantidad de numeros que desea generar: " )
	(bind ?n (read))
	(fibonacci ?n)
)