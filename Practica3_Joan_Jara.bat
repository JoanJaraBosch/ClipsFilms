;;; Netegem l'entorn CLIPS i carregem les definicions
;;; de classes.

(clear)
(load "Practica3_Joan_Jara.clp")

;;; Fem instancies d'algunes películes.

(make-instance RomeoJulieta of Drama)
(make-instance BajoLaMismaEstrella of Romantiques)
(make-instance BridgetJones of ComediaRomantica)
(make-instance DosTontosMuyTontos of Comedia)
(make-instance ElSilencioBlanco of Documentals)
(make-instance Up of Infantils)
(make-instance Saw of Gore)
(make-instance Begotten of Bizarre)
(make-instance Multiple of Suspense)
(make-instance FastAndFurious of Conduccio)
(make-instance JuegoDeHonor of Esports)
(make-instance SpaceJump of Esports)
(make-instance StarWars of Espacials)
(make-instance ThorRagnarok of Superherois)
(make-instance ET of CienciaFiccio)
(make-instance HarryPotter of Aventura)
(make-instance Narnia of Fantasia)
(make-instance Campeones of Drama)
(make-instance TheAmazingSpiderman of Superherois)
(make-instance Ladybug of Infantils)
(make-instance Frankenstein of Monstres)
(make-instance Package of Comedia)
(make-instance ElDictador of HumorNegre)
(make-instance ParanormalActivity of Terror)
(make-instance FoodInc of Documentals)
(make-instance Usuari of Usuari)


(defrule edatQuest
	?obj <- (object (is-a Usuari) (edat -1))
	?obj2 <- (object (is-a Tristes))
	?obj3 <- (object (is-a Por))
	?obj4 <- (object (is-a HumorNegre))
	?obj5 <- (object (is-a ComediaRomantica))
	=>
	(printout T "Quina edat tens?" crlf)
	(printout T "a) Entre 0-13" crlf)
	(printout T "b) Entre 14-17" crlf)
	(printout T "c) Entre 18-120" crlf)
	(printout T "Escriviu a, b o c siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(bind ?obj2 delete)
	(bind ?obj3 delete)
	(bind ?obj4 delete)
	(bind ?obj5 delete)
	(send ?obj canvia-edat 0)
	else(if(eq ?r b)
	then
	(bind ?obj3 delete)
	(bind ?obj4 delete)
	(send ?obj canvia-edat 1)
	else(if (eq ?r c)
	(send ?obj canvia-edat 2)
	)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule sexQuest
	?obj <- (object (is-a Usuari) (sexe nil))
	?obj2 <- (object (is-a Tristes))
	?obj3 <- (object (is-a Aventura))
	?obj4 <- (object (is-a Accio))
	?obj5 <- (object (is-a Emocionants))
	=>
	(printout T "Tens parella?" crlf)
	(printout T "a) Si" crlf)
	(printout T "b) No" crlf)
	(printout T "Escriviu a o b siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj canvia-estat parella)
	else(if(eq ?r b)
	then
	(send ?obj1 canvia-puntuacio 100)
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj canvia-estat noparella)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule parellaQuest
		?obj <- (object (is-a Usuari) (estatCivil nil))
		?obj2 <- (object (is-a Tristes))
		?obj3 <- (object (is-a Emocionants))
		=>
)