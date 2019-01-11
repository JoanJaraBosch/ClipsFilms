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
(make-instance ParanormalActivity of Monstres)
(make-instance FoodInc of Documentals)
(modify-instance FoodInc (tipusDocumentals animals))
(make-instance Usuari of Usuari)

(defrule edatA
	?obj <- (object (is-a Usuari) (edat a))
	?obj2 <- (object (is-a Tristes) (edatP nil))
	?obj3 <- (object (is-a Por) (edatP nil))
	?obj4 <- (object (is-a HumorNegre) (edatP nil))
	?obj6 <- (object (is-a Infantils) (edatP nil))
	=>
	(send ?obj2 delete)
	(send  ?obj3 delete)
	(send  ?obj4 delete)
	(send  ?obj6 canvia-puntuacio 100)
	(send ?obj6 canvia-edatP a)
)

(defrule edatB
	?obj <- (object (is-a Usuari) (edat b))
	?obj3 <- (object (is-a Por) (edatP nil))
	?obj4 <- (object (is-a HumorNegre) (edatP nil))
	?obj5 <- (object (is-a ComediaRomantica) (edatP nil))
	?obj7 <- (object (is-a Riure) (edatP nil))
	?obj8 <- (object (is-a Emocionants) (edatP nil))
	=>
	(send  ?obj3 delete)
	(send  ?obj4 delete)
	(send  ?obj7 canvia-puntuacio 100)
	(send  ?obj8 canvia-puntuacio 100)
	(send  ?obj5 canvia-puntuacio 50)
	(send ?obj5 canvia-edatP b)
	(send ?obj7 canvia-edatP b)
	(send ?obj8 canvia-edatP b)
)

(defrule edatC
	?obj <- (object (is-a Usuari) (edat c))
	?obj3 <- (object (is-a Por) (edatP nil))
	?obj4 <- (object (is-a HumorNegre) (edatP nil))
	?obj5 <- (object (is-a ComediaRomantica) (edatP nil))
	
	=>
	(send  ?obj3 canvia-puntuacio 100)
	(send  ?obj4 canvia-puntuacio 100)
	(send  ?obj5 canvia-puntuacio 100)
	(send ?obj3 canvia-edatP b)
	(send ?obj4 canvia-edatP b)
	(send ?obj5 canvia-edatP b)
)

(defrule edatQuest
	?obj <- (object (is-a Usuari) (edat nil))
	=>
	(printout T "Quina edat tens?" crlf)
	(printout T "a) Entre 0-13" crlf)
	(printout T "b) Entre 14-17" crlf)
	(printout T "c) Entre 18-120" crlf)
	(printout T "Escriviu a, b o c siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-edat ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule sexA
	?obj <- (object (is-a Usuari) (sexe a))
	?obj2 <- (object (is-a Tristes) (sexe nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-sexeP a)
)

(defrule sexB
	?obj <- (object (is-a Usuari) (sexe b))
	?obj2 <- (object (is-a Emocionants)(sexe nil) )
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-sexeP b)
)

(defrule sexQuest
	?obj <- (object (is-a Usuari) (sexe nil))
	=>
	(printout T "A quin sexe pertanys?" crlf)
	(printout T "a) Femení" crlf)
	(printout T "b) Masculí" crlf)
	(printout T "Escriviu a o b siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-sexe ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule parellaA
	?obj <- (object (is-a Usuari) (estatCivil a))
	?obj2 <- (object (is-a Tristes) (estatCivil nil))
	?obj4 <- (object (is-a ComediaRomantica) (estatCivil nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj2 canvia-estatP a)
	(send ?obj4 canvia-estatP a)
)

(defrule parellaB
	?obj <- (object (is-a Usuari) (estatCivil b))
	?obj2 <- (object (is-a Aventura) (estatCivil nil))
	?obj4 <- (object (is-a Emocionants) (estatCivil nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj2 canvia-estatP b)
	(send ?obj4 canvia-estatP b)
)

(defrule parellaQuest
	?obj <- (object (is-a Usuari) (estatCivil nil))
	=>
	(printout T "Tens parella?" crlf)
	(printout T "a) Si" crlf)
	(printout T "b) No" crlf)
	(printout T "Escriviu a o b siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-estat ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule emocioA
	?obj <- (object (is-a Usuari) (emocionalment a))
	?obj2 <- (object (is-a Tristes)(emocionalment nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-estatP a)
)

(defrule emocioB
	?obj <- (object (is-a Usuari) (emocionalment b))
	?obj2 <- (object (is-a Riure)(emocionalment nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-emocioP b)
)

(defrule emocioC
	?obj <- (object (is-a Usuari) (emocionalment c))
	?obj2 <- (object (is-a Accio)(emocionalment nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-emocioP c)
)

(defrule emocioQuest
	?obj <- (object (is-a Usuari) (emocionalment nil))
	=>
	(printout T "Com et trobes?" crlf)
	(printout T "a) Trist/a" crlf)
	(printout T "b) Normal" crlf)
	(printout T "c) Content" crlf)
	(printout T "Escriviu a, b o c siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-emocionalment ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule esportA
	?obj <- (object (is-a Usuari) (esportista a))
	?obj2 <- (object (is-a Accio)(esportista nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-esportP a)
)

(defrule esportB
	?obj <- (object (is-a Usuari) (esportista b))
	?obj2 <- (object (is-a Accio)(esportista nil))
	=>
	(send ?obj2 canvia-puntuacio-negatiu 100)
	(send ?obj2 canvia-esportP b)
)

(defrule esportsQuest
	?obj <- (object (is-a Usuari) (esportista nil))
	=>
	(printout T "Practiques algun esport?" crlf)
	(printout T "a) Si" crlf)
	(printout T "b) No" crlf)
	(printout T "Escriviu a o b siusplau." crlf)
	(bind ?r (read))
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule vehicleA
	?obj <- (object (is-a Usuari) (vehicle a) (edat c))
	?obj2 <- (object (is-a Conduccio)(vehicle nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-vehicleP a)
)

(defrule vehicleB
	?obj <- (object (is-a Usuari) (vehicle b) (edat c))
	?obj2 <- (object (is-a Conduccio)(vehicle nil))
	=>
	(send ?obj2 canvia-puntuacio-negatiu 100)
	(send ?obj2 canvia-vehicleP b)
)

(defrule vehicleQuest
	?obj <- (object (is-a Usuari) (vehicle nil) (edat c))
	=>
	(printout T "Tens cotxe o moto?" crlf)
	(printout T "a) Si" crlf)
	(printout T "b) No" crlf)
	(printout T "Escriviu a o b siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-vehicle ?r)	
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule pensarA
	?obj <- (object (is-a Usuari) (pensar a))
	?obj2 <- (object (is-a Por) (pensar nil))
	?obj3 <- (object (is-a Tranquiles) (pensar nil))
	?obj4 <- (object (is-a Emocionants) (pensar nil))
	?obj5 <- (object (is-a Accio) (pensar nil))
	=>
	(send ?obj4 canvia-puntuacio-negatiu 50)
	(send ?obj5 canvia-puntuacio-negatiu 50)
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj4 canvia-pensarP a)
	(send ?obj5 canvia-pensarP a)
	(send ?obj2 canvia-pensarP a)
	(send ?obj3 canvia-pensarP a)
)

(defrule pensarB
	?obj <- (object (is-a Usuari) (pensar b))
	?obj2 <- (object (is-a Por) (pensar nil))
	?obj3 <- (object (is-a Tranquiles) (pensar nil))
	?obj4 <- (object (is-a Emocionants) (pensar nil))
	?obj5 <- (object (is-a Accio) (pensar nil))
	=>
	(send ?obj2 canvia-puntuacio-negatiu 50)
	(send ?obj3 canvia-puntuacio-negatiu 50)
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj5 canvia-puntuacio 100)
	(send ?obj4 canvia-pensarP b)
	(send ?obj5 canvia-pensarP b)
	(send ?obj2 canvia-pensarP b)
	(send ?obj3 canvia-pensarP b)
)

(defrule pensarQuest
	?obj <- (object (is-a Usuari) (pensar nil))
	=>
	(printout T "Tagrada pensar?" crlf)
	(printout T "a) Si" crlf)
	(printout T "b) No" crlf)
	(printout T "Escriviu a o b siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-pensar ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule socialA
	?obj <- (object (is-a Usuari) (social a))
	?obj2 <- (object (is-a Accio) (social nil))
	?obj3 <- (object (is-a Emocionants)(social nil))
	?obj4 <- (object (is-a Riure)(social nil))
	?obj5 <- (object (is-a Tranquiles)(social nil))
	?obj6 <- (object (is-a Por)(social nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj5 canvia-puntuacio 10)
	(send ?obj6 canvia-puntuacio 10)
	(send ?obj2 canvia-socialP a)
	(send ?obj3 canvia-socialP a)
	(send ?obj4 canvia-socialP a)
	(send ?obj5 canvia-socialP a)
	(send ?obj6 canvia-socialP a)
)

(defrule socialB
	?obj <- (object (is-a Usuari) (social b))
	?obj2 <- (object (is-a Accio) (social nil))
	?obj3 <- (object (is-a Emocionants)(social nil))
	?obj4 <- (object (is-a Riure)(social nil))
	?obj5 <- (object (is-a Tranquiles)(social nil))
	?obj6 <- (object (is-a Por)(social nil))
	=>
	(send ?obj5 canvia-puntuacio 100)
	(send ?obj6 canvia-puntuacio 100)
	(send ?obj2 canvia-puntuacio 10)
	(send ?obj3 canvia-puntuacio 10)
	(send ?obj4 canvia-puntuacio 10)
	(send ?obj2 canvia-socialP b)
	(send ?obj3 canvia-socialP b)
	(send ?obj4 canvia-socialP b)
	(send ?obj5 canvia-socialP b)
	(send ?obj6 canvia-socialP b)
)

(defrule socialC
	?obj <- (object (is-a Usuari) (social c))
	?obj2 <- (object (is-a Accio) (social nil))
	?obj3 <- (object (is-a Emocionants)(social nil))
	?obj7 <- (object (is-a Aventura)(social nil))
	=>
	(send ?obj2 canvia-puntuacio 10)
	(send ?obj3 canvia-puntuacio 10)
	(send ?obj7 canvia-puntuacio 50)
	(send ?obj2 canvia-socialP c)
	(send ?obj3 canvia-socialP c)
	(send ?obj7 canvia-socialP c)
)

(defrule socialQuest
	?obj <- (object (is-a Usuari) (social nil))
	=>
	(printout T "Quedes amb gent?" crlf)
	(printout T "a) Molt sovint" crlf)
	(printout T "b) No gaire sovint" crlf)
	(printout T "c) Ocasionalment" crlf)
	(printout T "Escriviu a, b o c siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-social ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule musicaA
	?obj <- (object (is-a Usuari) (tipusMusica a))
	?obj2 <- (object (is-a Accio)(tipusMusica nil))
	?obj3 <- (object (is-a Por)(tipusMusica nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj2 canvia-musicaP a)
	(send ?obj3 canvia-musicaP a)
)

(defrule musicaB
	?obj <- (object (is-a Usuari) (tipusMusica b))
	?obj2 <- (object (is-a Tristes)(tipusMusica nil))
	?obj3 <- (object (is-a Tranquiles)(tipusMusica nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj2 canvia-musicaP b)
	(send ?obj3 canvia-musicaP b)
)

(defrule musicaC
	?obj <- (object (is-a Usuari) (tipusMusica c))
	?obj2 <- (object (is-a Emocionants)(tipusMusica nil))
	?obj3 <- (object (is-a Riure)(tipusMusica nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj2 canvia-musicaP c)
	(send ?obj3 canvia-musicaP c)
)

(defrule musicaQuest
	?obj <- (object (is-a Usuari) (tipusMusica nil))
	=>
	(printout T "Quina musica prefereixes?" crlf)
	(printout T "a) Rock&Roll" crlf)
	(printout T "b) Classica" crlf)
	(printout T "c) Pop" crlf)
	(printout T "Escriviu a, b o c siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-tipusMusica ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule profeA
	?obj <- (object (is-a Usuari) (professioEscolliries a))
	?obj2 <- (object (is-a Emocionants)(professioEscolliries nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-profeP a)
)

(defrule profeB
	?obj <- (object (is-a Usuari) (professioEscolliries b))
	?obj2 <- (object (is-a Documentals)(professioEscolliries nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-profeP b)
)

(defrule profeC
	?obj <- (object (is-a Usuari) (professioEscolliries c))
	?obj2 <- (object (is-a Esports)(professioEscolliries nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-profeP c)
)

(defrule profeD
	?obj <- (object (is-a Usuari) (professioEscolliries d))
	?obj2 <- (object (is-a Infantils)(professioEscolliries nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-profeP d)
)

(defrule professioQuest
	?obj <- (object (is-a Usuari) (professioEscolliries nil))
	=>
	(printout T "Quina professio preferiries fer?" crlf)
	(printout T "a) Policia" crlf)
	(printout T "b) Bibliotecari" crlf)
	(printout T "c) Entrenador" crlf)
	(printout T "d) Professor" crlf)
	(printout T "Escriviu a, b, c o d siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-professioEscolliries ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule tempsLliureA
	?obj <- (object (is-a Usuari) (tempsLliure a))
	?obj2 <- (object (is-a Tranquiles)(tempsLliure nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-tempsLliureP a)
)

(defrule tempsLliureB
	?obj <- (object (is-a Usuari) (tempsLliure b))
	?obj2 <- (object (is-a Emocionants)(tempsLliure nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-tempsLliureP b)
)

(defrule tempsLliureC
	?obj <- (object (is-a Usuari) (tempsLliure c))
	?obj2 <- (object (is-a Riure)(tempsLliure nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-tempsLliureP c)
)

(defrule tempsLliureD
	?obj <- (object (is-a Usuari) (tempsLliure d))
	?obj2 <- (object (is-a Por)(tempsLliure nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-tempsLliureP d)
)

(defrule tempsLliureE
	?obj <- (object (is-a Usuari) (tempsLliure e))
	?obj2 <- (object (is-a Tristes)(tempsLliure nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-tempsLliureP e)
)

(defrule tempsLliureQuest
	?obj <- (object (is-a Usuari) (tempsLliure nil))
	=>
	(printout T "Que fas en el teu temps lliure?" crlf)
	(printout T "a) Res" crlf)
	(printout T "b) Jugar" crlf)
	(printout T "c) Explicar acudits" crlf)
	(printout T "d) Rituals satanics" crlf)
	(printout T "e) Pensar en algun noi/a especial" crlf)
	(printout T "Escriviu a, b, c, d o e siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-tempsLliure ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule festaA
	?obj <- (object (is-a Usuari) (festaPrefe a))
	?obj2 <- (object (is-a Riure)(festaPrefe nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-festaP a)
)

(defrule festaB
	?obj <- (object (is-a Usuari) (festaPrefe b))
	?obj2 <- (object (is-a Emocionants)(festaPrefe nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-festaP b)
)

(defrule festaC
	?obj <- (object (is-a Usuari) (festaPrefe c))
	?obj2 <- (object (is-a Por)(festaPrefe nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-festaP c)
)

(defrule festaD
	?obj <- (object (is-a Usuari) (festaPrefe d))
	?obj2 <- (object (is-a Tristes)(festaPrefe nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-festaP d)
)

(defrule festaPrefeQuest
	?obj <- (object (is-a Usuari) (festaPrefe nil))
	=>
	(printout T "Quina es la teva festivitat preferida?" crlf)
	(printout T "a) Sants Inocents" crlf)
	(printout T "b) Carnaval" crlf)
	(printout T "c) Halloween" crlf)
	(printout T "d) Sant Valenti" crlf)
	(printout T "Escriviu a, b, c o d siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-festaPrefe ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule viatgeA
	?obj <- (object (is-a Usuari) (viatge a))
	?obj2 <- (object (is-a Riure)(viatge nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-viatgeP a)
)

(defrule viatgeB
	?obj <- (object (is-a Usuari) (viatge b))
	?obj2 <- (object (is-a Emocionants)(viatge nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-viatgeP b)
)

(defrule viatgeC
	?obj <- (object (is-a Usuari) (viatge c))
	?obj2 <- (object (is-a Tranquiles)(viatge nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-viatgeP c)
)

(defrule viatgeD
	?obj <- (object (is-a Usuari) (viatge d))
	?obj2 <- (object (is-a Por)(viatge nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-viatgeP d)
)

(defrule viatgeQuest
	?obj <- (object (is-a Usuari) (viatge nil))
	=>
	(printout T "On preferireis anar de viatge?" crlf)
	(printout T "a) Andalucia" crlf)
	(printout T "b) Disneyland Paris" crlf)
	(printout T "c) A la muntanya" crlf)
	(printout T "d) Casa Embruixada" crlf)
	(printout T "Escriviu a, b, c o d siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-viatge ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule pasarTempsA
	?obj <- (object (is-a Usuari) (pasarTemps a))
	?obj2 <- (object (is-a Emocionants)(pasarTemps nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-pasarTempsP a)
)

(defrule pasarTempsB
	?obj <- (object (is-a Usuari) (pasarTemps b))
	?obj2 <- (object (is-a Tranquiles)(pasarTemps nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-pasarTempsP b)
)

(defrule pasarTempsC
	?obj <- (object (is-a Usuari) (pasarTemps c))
	?obj2 <- (object (is-a Riure)(pasarTemps nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-pasarTempsP c)
)

(defrule pasarTempsD
	?obj <- (object (is-a Usuari) (pasarTemps d))
	?obj2 <- (object (is-a Tristes)(pasarTemps nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-pasarTempsP d)
)

(defrule pasarTempsE
	?obj <- (object (is-a Usuari) (pasarTemps e))
	?obj2 <- (object (is-a Por)(pasarTemps nil))
	=>
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj2 canvia-pasarTempsP e)
)

(defrule pasarTempsQuest
	?obj <- (object (is-a Usuari) (pasarTemps nil))
	=>
	(printout T "Amb qui preferirires passar temps?" crlf)
	(printout T "a) Algu musculos" crlf)
	(printout T "b) Algu inteligent" crlf)
	(printout T "c) Algu divertit" crlf)
	(printout T "d) Algu sentimental" crlf)
	(printout T "e) Algu terrorific" crlf)
	(printout T "Escriviu a, b, c ,d o e siusplau." crlf)
	(bind ?r (read))
	(send ?obj canvia-pasarTemps ?r)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule order
	(declare (salience -1))
	?obj <- (object (is-a Usuari) (pelicules ?s&:(> ?s 0)))
	?obj2 <- (object (is-a Pelicules) (puntuacio ?p))
	(not (object (is-a Pelicules) (puntuacio ?q&:(> ?q ?p))))
	=>
	(send ?obj canvia-pelicules 1)
	(send ?obj2 print)
	(send ?obj2 delete)
)
