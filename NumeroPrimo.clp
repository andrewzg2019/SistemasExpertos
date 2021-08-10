(deffunction esPrimo (?n)
	(bind ?c 0)
	(loop-for-count(?i 1 ?n)
	(bind ?m (mod ?n ?i))
	(if (= ?m 0) then
	(bind ?c (+ ?c 1))
	)
	)
	(if (= ?c 2)then
	(printout t "Es un numero primo" crlf)
	else
	(printout t "No es un numero primo" crlf)
)
)

(defrule inicio
	(initial-fact)
	=>
	(printout t "Ingrese un numero: ")
	(bind ?n (read))
	(esPrimo ?n)
)