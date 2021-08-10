(deftemplate animal
	(field nombre)
	(multifield tiene)
	(multifield come-tiene)
	(multifield mueve)
	(multifield color)
	(multifield caracteristicas)
)

(deftemplate vertebrado
	(field tipo_vertebrado)
)

(deftemplate superorden
	(field tipo_orden)
)

(deftemplate alimentacion
	(field tipo_alimentacion)
)

(defrule inicio
	(initial-fact)
	=>
	(printout t "Nombre animal:" crlf)
	(bind ?nombre (read))
	(printout t "El animal, (tiene pelos/da leche/tiene plumas/pone huevos )" crlf)
	(bind ?tiene (readline))
	(printout t "El animal come/tiene (carne/dientes puntiagudos/garras/ojos al frente )" crlf)
	(bind ?come-tiene (readline))
	(printout t "El animal (vuela bien/no vuela nada/no vuela)" crlf)
	(bind ?mueve (readline))
	(printout t "Animal de color (blanco y negro/leonado con rayas negras/rayas negras/manchas oscuras)" crlf)
	(bind ?color (readline))
	(printout t "Carateristicas particulares (cuello largo y piernas largas/sin datos)" crlf)
	(bind ?caracteristicas (readline))
	(assert (animal (nombre ?nombre)(tiene ?tiene)(come-tiene ?come-tiene)(mueve ?mueve)(color ?color)(caracteristicas 
	?caracteristicas)))
)

(defrule R1
	(animal (nombre ?nombre)(tiene "tiene pelos"|"da leche")(come-tiene ?)(mueve ?)(color ?)(caracteristicas ?))
	=>
	(printout t ?nombre" -->Es Mamifero" crlf)
	(assert (vertebrado (tipo_vertebrado mamifero)))
)

(defrule R2
	(animal (nombre ?nombre)(tiene "pone huevos"|"tiene plumas")(come-tiene ?)(mueve ?)(color ?)(caracteristicas ?))
	=>
	(printout t ?nombre" -->Es una ave" crlf)
	(assert (vertebrado (tipo_vertebrado ave)))
)

(defrule R3
	(animal (nombre ?nombre)(tiene ?)(come-tiene "carne"|"dientes puntiagudos"|"garras"|"ojos al frente")(mueve ?)(color ?)	(caracteristicas ?))
	=>
	(printout t ?nombre" -->Es un carnivoro" crlf)
	(assert (alimentacion (tipo_alimentacion carnivoro)))
)

(defrule R4
	(vertebrado (tipo_vertebrado mamifero))
	=>
	(printout t "Tiene pezunia?:")
	(bind ?respuesta (readline))
	(if (eq ?respuesta "si")
		then
		(printout t "Es Ungulado" crlf)
		(assert (superorden(tipo_orden ungulado)))	
	else 
	(printout t "Rumia?:")
	(bind ?respuesta2 (readline))
	(if (eq ?respuesta2 "si")
		then
		(printout t "Es Ungulado" crlf)
		(assert (superorden(tipo_orden ungulado)))
	)
	)
)

(defrule R5
	(vertebrado (tipo_vertebrado mamifero))
	(alimentacion (tipo_alimentacion carnivoro))
	(animal (nombre ?nombre)(tiene ?)(come-tiene ?)(mueve ?)(color "leonado con rayas negras"))
	=>
	(printout t ?nombre ", tigre")
	
)

(defrule R6
	(superorden(tipo_orden ungulado))
	(animal (nombre ?nombre)(tiene ?)(come-tiene ?)(mueve ?)(color "manchas oscuras")(caracteristicas "cuello largo y piernas largas"))
	=>
	(printout t ?nombre ", es una Jirafa")
	
)

(defrule R7
	(superorden(tipo_orden ungulado))
	(animal (nombre ?nombre)(tiene ?)(come-tiene ?)(mueve ?)(color "rayas negras")(caracteristicas ?))
	=>
	(printout t ?nombre ", es una Cebra")
	
)

(defrule R8
	(vertebrado (tipo_vertebrado ave))
	(animal (nombre ?nombre)(tiene ?)(come-tiene ?)(mueve "no vuela")(color "blanco y negro")
	(caracteristicas "cuello largo y piernas largas"))
	=>
	(printout t ?nombre ", es una Avestruz" crlf)
)

(defrule R9
	(vertebrado (tipo_vertebrado ave))
	(animal (nombre ?nombre)(tiene ?)(come-tiene ?)(mueve "no vuela nada")(color "blanco y negro")(caracteristicas ?))
	=>
	(printout t ?nombre ", es un Pinguino" crlf)
)

(defrule R10
	(vertebrado (tipo_vertebrado ave))
	(animal (nombre ?nombre)(tiene ?)(come-tiene ?)(mueve "vuela bien")(color ?)(caracteristicas ?))
	=>
	(printout t ?nombre ", es un Albatros" crlf)
)