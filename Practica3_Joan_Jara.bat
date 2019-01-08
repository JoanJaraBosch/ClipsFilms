;;; Netegem l'entorn CLIPS i carregem les definicions
;;; de classes.

(clear)
(load "Practica3_Joan_Jara.clp")

;;; Fem instancies d'algunes pel�cules.

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
	?obj <- (object (is-a Usuari) (edat nil))
	?obj2 <- (object (is-a Tristes))
	?obj3 <- (object (is-a Por))
	?obj4 <- (object (is-a HumorNegre))
	?obj5 <- (object (is-a ComediaRomantica))
	?obj6 <- (object (is-a Infantils))
	?obj7 <- (object (is-a Riure))
	?obj8 <- (object (is-a Aventura))
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
	(bind ?obj6 canvia-puntuacio 100)
	(send ?obj canvia-edat a)
	else(if(eq ?r b)
	then
	(bind ?obj3 delete)
	(bind ?obj4 delete)
	(bind ?obj7 canvia-puntuacio 100)
	(bind ?obj8 canvia-puntuacio 100)
	(send ?obj canvia-edat b)
	else(if (eq ?r c)
	then
	(send ?obj canvia-edat c)
	(bind ?obj3 canvia-puntuacio 100)
	(bind ?obj4 canvia-puntuacio 100)
	)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule sexQuest
	?obj <- (object (is-a Usuari) (sexe nil))
	?obj2 <- (object (is-a Tristes))
	?obj3 <- (object (is-a Emocionants))
	=>
	(printout T "A quin sexe pertanys?" crlf)
	(printout T "a) Femen�" crlf)
	(printout T "b) Mascul�" crlf)
	(printout T "Escriviu a o b siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj canvia-sexe femeni)
	else(if(eq ?r b)
	then
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj canvia-sexe masculi)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule parellaQuest
	?obj <- (object (is-a Usuari) (estatCivil nil))
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
	(send ?obj5 canvia-puntuacio 100)
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj canvia-estat noparella)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule emocioQuest
	?obj <- (object (is-a Usuari) (emocionalment nil))
	?obj2 <- (object (is-a Tristes))
	?obj3 <- (object (is-a Riure))
	?obj4 <- (object (is-a Accio))
	=>
	(printout T "Tens parella?" crlf)
	(printout T "a) Trist/a" crlf)
	(printout T "b) Normal" crlf)
	(printout T "c) Content" crlf)
	(printout T "Escriviu a, b o c siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj canvia-emocionalment trist)
	else(if(eq ?r b)
	then
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj canvia-emocionalment normal)
	else(if(eq ?r c)
	then
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj canvia-emocionalment content)
	)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule esportsQuest
	?obj <- (object (is-a Usuari) (esportista nil))
	?obj2 <- (object (is-a Esports))
	=>
	(printout T "Practiques algun esport?" crlf)
	(printout T "a) Si" crlf)
	(printout T "b) No" crlf)
	(printout T "Escriviu a o b siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj canvia-esportista si)
	else(if(eq ?r b)
	then
	(send ?obj2 canvia-puntuacio-negatiu 50)
	(send ?obj canvia-esportista no)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule vehicleQuest
	?obj <- (object (is-a Usuari) (vehicle nil))
	?obj2 <- (object (is-a Conduccio))
	=>
	(printout T "Tens cotxe o moto?" crlf)
	(printout T "a) Si" crlf)
	(printout T "b) No" crlf)
	(printout T "Escriviu a o b siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj canvia-vehicle si)
	else(if(eq ?r b)
	then
	(send ?obj2 canvia-puntuacio-negatiu 50)
	(send ?obj canvia-vehicle no)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule pensarQuest
	?obj <- (object (is-a Usuari) (pensar nil))
	?obj2 <- (object (is-a Por))
	?obj3 <- (object (is-a Tranquiles))
	=>
	(printout T "Tagrada pensar?" crlf)
	(printout T "a) Si" crlf)
	(printout T "b) No" crlf)
	(printout T "Escriviu a o b siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj3 canvia-puntuacio-negatiu 50)
	(send ?obj canvia-pensar si)
	else(if(eq ?r b)
	then
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj2 canvia-puntuacio-negatiu 50)
	(send ?obj canvia-pensar no)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule socialQuest
	?obj <- (object (is-a Usuari) (social nil))
	?obj2 <- (object (is-a Accio))
	?obj3 <- (object (is-a Emocionants))
	?obj4 <- (object (is-a Riure))
	?obj5 <- (object (is-a Tranquiles))
	?obj6 <- (object (is-a Por))
	?obj7 <- (object (is-a Aventura))
	=>
	(printout T "Quedes amb gent?" crlf)
	(printout T "a) Molt sovint" crlf)
	(printout T "b) No gaire sovint" crlf)
	(printout T "c) Ocasionalment" crlf)
	(printout T "Escriviu a, b o c siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj5 canvia-puntuacio 10)
	(send ?obj6 canvia-puntuacio 10)
	(send ?obj canvia-social si)
	else(if(eq ?r b)
	then
	(send ?obj5 canvia-puntuacio 100)
	(send ?obj6 canvia-puntuacio 100)
	(send ?obj2 canvia-puntuacio 10)
	(send ?obj3 canvia-puntuacio 10)
	(send ?obj4 canvia-puntuacio 10)
	(send ?obj canvia-social no)
	)
	else(if(eq ?r c)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj7 canvia-puntuacio 50)
	(send ?obj canvia-social ocasionalment)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule musicaQuest
	?obj <- (object (is-a Usuari) (tipusMusica nil))
	?obj2 <- (object (is-a Accio))
	?obj3 <- (object (is-a Por))
	?obj4 <- (object (is-a Tristes))
	?obj5 <- (object (is-a Tranquiles))
	?obj6 <- (object (is-a Aventura))
	?obj7 <- (object (is-a Riure))
	=>
	(printout T "Quina musica prefereixes?" crlf)
	(printout T "a) Rock&Roll" crlf)
	(printout T "b) Classica" crlf)
	(printout T "c) Pop" crlf)
	(printout T "Escriviu a, b o c siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj canvia-tipusMusica rock)
	else(if(eq ?r b)
	then
	(send ?obj5 canvia-puntuacio 100)
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj canvia-tipusMusica classica)
	)
	else(if(eq ?r c)
	then
	(send ?obj6 canvia-puntuacio 100)
	(send ?obj7 canvia-puntuacio 100)
	(send ?obj canvia-tipusMusica pop)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule professioQuest
	?obj <- (object (is-a Usuari) (professioEscolliries nil))
	?obj2 <- (object (is-a Accio))
	?obj3 <- (object (is-a Esports))
	?obj4 <- (object (is-a Infantils))
	?obj5 <- (object (is-a Tranquiles))
	?obj6 <- (object (is-a Documentals))
	?obj7 <- (object (is-a Emocionants))
	=>
	(printout T "Quina professio preferiries fer?" crlf)
	(printout T "a) Policia" crlf)
	(printout T "b) Bibliotecari" crlf)
	(printout T "c) Entrenador" crlf)
	(printout T "d) Professor" crlf)
	(printout T "Escriviu a, b, c o d siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj7 canvia-puntuacio 100)
	(send ?obj canvia-professioEscolliries Policia)
	else(if(eq ?r b)
	then
	(send ?obj5 canvia-puntuacio 100)
	(send ?obj canvia-professioEscolliries Bibliotecari)
	)
	else(if(eq ?r c)
	then
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj canvia-professioEscolliries Entrenador)
	else(if(eq ?r d)
	then
	(send ?obj6 canvia-puntuacio 100)
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj canvia-professioEscolliries Professor)
	)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule tempsLliureQuest
	?obj <- (object (is-a Usuari) (tempsLliure nil))
	?obj2 <- (object (is-a Tranquiles))
	?obj3 <- (object (is-a Por))
	?obj4 <- (object (is-a Infantils))
	?obj5 <- (object (is-a Accio))
	?obj6 <- (object (is-a Riure))
	?obj8 <- (object (is-a Tristes))
	?obj7 <- (object (is-a Emocionants))
	=>
	(printout T "Que fas en el teu temps lliure?" crlf)
	(printout T "a) Res" crlf)
	(printout T "b) Jugar" crlf)
	(printout T "c) Explicar acudits" crlf)
	(printout T "d) Rituals satanics" crlf)
	(printout T "e) Pensar en algun noi/a especial" crlf)
	(printout T "Escriviu a, b, c, d o e siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj canvia-tempsLliure Res)
	else(if(eq ?r b)
	then
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj5 canvia-puntuacio 100)
	(send ?obj7 canvia-puntuacio 100)
	(send ?obj canvia-tempsLliure Jugar)
	)
	else(if(eq ?r c)
	then
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj canvia-tempsLliure ExplicarAcudits)
	else(if(eq ?r d)
	then
	(send ?obj6 canvia-puntuacio 100)
	(send ?obj canvia-tempsLliure Rituals)
	else(if(eq ?r e)
	then
	(send ?obj8 canvia-puntuacio 100)
	(send ?obj canvia-tempsLliure pensarenalgu)
	)
	)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule festaPrefeQuest
	?obj <- (object (is-a Usuari) (festaPrefe nil))
	?obj2 <- (object (is-a Riure))
	?obj3 <- (object (is-a Infantils))
	?obj4 <- (object (is-a Por))
	?obj5 <- (object (is-a Tristes))
	=>
	(printout T "Quina es la teva festivitat preferida?" crlf)
	(printout T "a) Sants Inocents" crlf)
	(printout T "b) Carnaval" crlf)
	(printout T "c) Halloween" crlf)
	(printout T "d) Sant Valenti" crlf)
	(printout T "Escriviu a, b, c o d siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj canvia-festaPrefe inocents)
	else(if(eq ?r b)
	then
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj canvia-festaPrefe carnaval)
	)
	else(if(eq ?r c)
	then
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj canvia-festaPrefe halloween)
	else(if(eq ?r d)
	then
	(send ?obj5 canvia-puntuacio 100)
	(send ?obj canvia-festaPrefe valenti)
	)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule viatgeQuest
	?obj <- (object (is-a Usuari) (viatge nil))
	?obj2 <- (object (is-a Riure))
	?obj3 <- (object (is-a Accio))
	?obj6 <- (object (is-a Emocionants))
	?obj7 <- (object (is-a Infantils))
	?obj4 <- (object (is-a Por))
	?obj5 <- (object (is-a Tristes))
	=>
	(printout T "On preferireis anar de viatge?" crlf)
	(printout T "a) Andalucia" crlf)
	(printout T "b) Disneyland" crlf)
	(printout T "c) Paris" crlf)
	(printout T "d) Casa Embruixada" crlf)
	(printout T "Escriviu a, b, c o d siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj canvia-viatge andalucia)
	else(if(eq ?r b)
	then
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj6 canvia-puntuacio 100)
	(send ?obj7 canvia-puntuacio 100)
	(send ?obj canvia-viatge disneyland)
	)
	else(if(eq ?r c)
	then
	(send ?obj5 canvia-puntuacio 100)
	(send ?obj canvia-viatge paris)
	else(if(eq ?r d)
	then
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj canvia-viatge embruixada)
	)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)

(defrule pasarTempsQuest
	?obj <- (object (is-a Usuari) (pasarTemps nil))
	?obj2 <- (object (is-a Riure))
	?obj3 <- (object (is-a Accio))
	?obj6 <- (object (is-a Emocionants))
	?obj7 <- (object (is-a Tranquiles))
	?obj4 <- (object (is-a Por))
	?obj5 <- (object (is-a Tristes))
	=>
	(printout T "Amb qui preferirires passar temps?" crlf)
	(printout T "a) Algu musculos" crlf)
	(printout T "b) Algu inteligent" crlf)
	(printout T "c) Algu divertit" crlf)
	(printout T "d) Algu sentimental" crlf)
	(printout T "e) Algu terrorific" crlf)
	(printout T "Escriviu a, b, c ,d o e siusplau." crlf)
	(bind ?r (read))
	(if(eq ?r a)
	then
	(send ?obj3 canvia-puntuacio 100)
	(send ?obj6 canvia-puntuacio 100)
	(send ?obj canvia-pasarTemps musculos)
	else(if(eq ?r b)
	then
	(send ?obj7 canvia-puntuacio 100)
	(send ?obj canvia-pasarTemps inteligent)
	)
	else(if(eq ?r c)
	then
	(send ?obj2 canvia-puntuacio 100)
	(send ?obj canvia-pasarTemps divertit)
	else(if(eq ?r d)
	then
	(send ?obj5 canvia-puntuacio 100)
	(send ?obj canvia-pasarTemps sentimental)
	else(if(eq ?r e)
	then
	(send ?obj4 canvia-puntuacio 100)
	(send ?obj canvia-pasarTemps terrorific)
	)
	)
	)
	)
	(printout T "La resposata escollida es : " ?r crlf)
)
