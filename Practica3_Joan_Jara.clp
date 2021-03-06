;;; Cal posar (pattern-match reactive) per a que
;;; puguem escriure regles on es demanin condicions
;;; sobre objectes d'aquesta classe.
;;; Les classes reactives han de ser concretes, no
;;; poden ser abstractes.

(defclass Pelicules
   (is-a USER)
   (role abstract)
   (slot puntuacio (type INTEGER) (default 0))
   (slot plorar (type SYMBOL) (allowed-symbols yes no))
   (slot riure (type SYMBOL) (allowed-symbols yes no))
   (slot edat (type INTEGER))
   (slot edatP (type SYMBOL) (default nil))
	(slot sexe (type SYMBOL) (default nil))
	(slot estatCivil (type SYMBOL) (default nil))
	(slot vehicle (default nil))
	(slot social (default nil))
	(slot emocionalment (default nil))
	(slot esportista (default nil))
	(slot tipusMusica (default nil))
	(slot professioEscolliries (default nil))
	(slot tempsLliure (default nil))
	(slot viatge (default nil))
	(slot festaPrefe (default nil))
	(slot pasarTemps (default nil))
	(slot pensar (default nil))
)

(defclass Tristes
	(is-a Pelicules)
	(role abstract)
	(slot plorar (default yes))
	(slot riure (default no))
	(slot edat (range 13 150) (default 14))
	(slot acaba (type SYMBOL) (allowed-symbols be malament))
)

(defclass Riure
	(is-a Pelicules)
	(role abstract)
	(slot plorar (default no))
	(slot edat (range 0 150) (default 12))
	(slot riure (default yes))
)

(defclass Emocionants
	(is-a Pelicules)
	(role abstract)
	(slot plorar (default no))
	(slot edat (range 0 150) (default 12))
	(slot epoca (type SYMBOL) (allowed-symbols prehistorica futurista moderna classica mediaval) (default moderna))
)

(defclass Por
	(is-a Pelicules)
	(role abstract)
	(slot plorar (default yes))
	(slot edat (range 17 150) (default 18))
)

(defclass Tranquiles
	(is-a Pelicules)
	(role abstract)
	(slot plorar (default no))
	(slot edat (range 0 150)(default 12))
)

(defclass Drama
	(is-a Tristes)
	(role concrete)
	(pattern-match reactive) ;;;Quins poden disparar regles i quins no
	(slot acaba (default malament))
)

(defclass Romantiques
	(is-a Tristes)
	(role concrete)
	(pattern-match reactive) ;;;Quins poden disparar regles i quins no
	(slot acaba (default be))
)

(defclass Comedia
	(is-a Riure)
	(role concrete)
	(pattern-match reactive)
	(slot tipusHumor (type SYMBOL) (allowed-symbols Inglesa Parodia Tragicomedia Caracters PeixForaAigua))
)

(defclass HumorNegre
	(is-a Riure)
	(role concrete)
	(pattern-match reactive)
	(slot edat (range 18 150) (default 18))
)

(defclass ComediaRomantica
	(is-a Comedia Romantiques)
	(role concrete)
	(pattern-match reactive)
	(slot riure (default yes))
	(slot plorar (default yes))
	(slot edat (range 14 150) (default 14))
)

(defclass Fantasia
	(is-a Emocionants)
	(role concrete)
	(pattern-match reactive)
	(slot epoca (allowed-symbols mediaval futurista moderna) (default futurista))
)

(defclass Aventura
	(is-a Emocionants)
	(role concrete)
	(pattern-match reactive)
)

(defclass Accio
	(is-a Emocionants)
	(role abstract)
)

(defclass CienciaFiccio
	(is-a Emocionants)
	(role concrete)
	(pattern-match reactive)
	(slot personatges (type SYMBOL) (allowed-symbols mags extraterrestres mutants deus) (default extraterrestres))
)

(defclass Superherois
	(is-a Aventura CienciaFiccio)
	(role concrete)
	(pattern-match reactive)
	(slot creador (type SYMBOL) (allowed-symbols DC Marvel) (default Marvel))
)

(defclass Espacials
	(is-a Accio)
	(role concrete)
	(pattern-match reactive)
)

(defclass Esports
	(is-a Accio)
	(role concrete)
	(pattern-match reactive)
	(slot tipusEsport (type SYMBOL) (allowed-symbols basquet futbol artsMarcials) (default futbol))
)

(defclass Conduccio
	(is-a Accio)
	(role concrete)
	(pattern-match reactive)
	(slot conductors (type SYMBOL) (allowed-symbols motoristes cotxes) (default cotxes))
)

(defclass Monstres
	(is-a Por)
	(role concrete)
	(pattern-match reactive)
	(slot tipusMonstres (type SYMBOL) (allowed-symbols vampirs zombies aliens monstres) (default monstres))
)

(defclass Suspense
	(is-a Por)
	(role concrete)
	(pattern-match reactive)
)

(defclass Terror
	(is-a Por)
	(role concrete)
	(pattern-match reactive)
)

(defclass Bizarre
	(is-a Terror)
	(role concrete)
	(pattern-match reactive)
)

(defclass Gore
	(is-a Terror)
	(role concrete)
	(pattern-match reactive)
)

(defclass Infantils
	(is-a Tranquiles)
	(role concrete)
	(pattern-match reactive)
	(slot dibuixades (type SYMBOL) (allowed-symbols 3d 2d plastilina manga) (default 2d))
)

(defclass Documentals
	(is-a Tranquiles)
	(role concrete)
	(pattern-match reactive)
	(slot tipusDocumentals (type SYMBOL) (allowed-symbols animals historiques cosHuma naturalesa) (default naturalesa))
)

(defclass Usuari
	(is-a USER)
	(role concrete)
	(pattern-match reactive)
	(slot edat (type SYMBOL) (default nil))
	(slot sexe (type SYMBOL) (default nil))
	(slot estatCivil (type SYMBOL) (default nil))
	(slot vehicle (default nil))
	(slot social (default nil))
	(slot emocionalment (default nil))
	(slot esportista (default nil))
	(slot tipusMusica (default nil))
	(slot professioEscolliries (default nil))
	(slot tempsLliure (default nil))
	(slot viatge (default nil))
	(slot festaPrefe (default nil))
	(slot pasarTemps (default nil))
	(slot pensar (default nil))
	(slot pelicules (type INTEGER) (default 5))
)


(defmessage-handler Pelicules canvia-puntuacio (?punt)
   (bind ?self:puntuacio (+ ?punt ?self:puntuacio))
)

(defmessage-handler Pelicules canvia-ordenar (?punt)
   (bind ?self print)
)

(defmessage-handler Pelicules canvia-puntuacio-negatiu (?punt)
   (bind ?self:puntuacio (- ?self:puntuacio ?punt))
)

(defmessage-handler Usuari canvia-edat (?ed)
   (bind ?self:edat ?ed)
)

(defmessage-handler Pelicules canvia-edatP (?ed)
	(bind ?self:edatP ?ed)
)

(defmessage-handler Pelicules canvia-estatP (?ed)
	(bind ?self:estatCivil ?ed)
)

(defmessage-handler Pelicules canvia-emocioP (?ed)
	(bind ?self:emocionalment ?ed)
)

(defmessage-handler Pelicules canvia-musicaP (?ed)
	(bind ?self:tipusMusica ?ed)
)

(defmessage-handler Pelicules canvia-profeP (?ed)
	(bind ?self:professioEscolliries ?ed)
)

(defmessage-handler Pelicules canvia-tempsLliureP (?ed)
	(bind ?self:tempsLliure ?ed)
)

(defmessage-handler Pelicules canvia-festaP (?ed)
	(bind ?self:festaPrefe ?ed)
)

(defmessage-handler Pelicules canvia-viatgeP (?ed)
	(bind ?self:viatge ?ed)
)

(defmessage-handler Pelicules canvia-pasarTempsP (?ed)
	(bind ?self:pasarTemps ?ed)
)

(defmessage-handler Pelicules canvia-vehicleP (?ed)
	(bind ?self:vehicle ?ed)
)

(defmessage-handler Pelicules canvia-pensarP (?ed)
	(bind ?self:pensar ?ed)
)

(defmessage-handler Pelicules canvia-socialP (?ed)
	(bind ?self:social ?ed)
)

(defmessage-handler Pelicules canvia-esportP (?ed)
	(bind ?self:esportista ?ed)
)

(defmessage-handler Pelicules canvia-sexeP (?ed)
	(bind ?self:sexe ?ed)
)

(defmessage-handler Usuari canvia-sexe (?sex)
   (bind ?self:sexe ?sex)
)

(defmessage-handler Usuari canvia-estat (?estat)
   (bind ?self:estatCivil ?estat)
)

(defmessage-handler Usuari canvia-vehicle (?vel)
   (bind ?self:vehicle ?vel)
)

(defmessage-handler Usuari canvia-social (?sol)
   (bind ?self:social ?sol)
)

(defmessage-handler Usuari canvia-emocionalment (?em)
   (bind ?self:emocionalment ?em)
)

(defmessage-handler Usuari canvia-esportista (?es)
   (bind ?self:esportista ?es)
)

(defmessage-handler Usuari canvia-tipusMusica (?mus)
   (bind ?self:tipusMusica ?mus)
)

(defmessage-handler Usuari canvia-professioEscolliries (?prof)
   (bind ?self:professioEscolliries ?prof)
)

(defmessage-handler Usuari canvia-tempsLliure (?temps)
   (bind ?self:tempsLliure ?temps)
)

(defmessage-handler Usuari canvia-viatge (?vi)
   (bind ?self:viatge ?vi)
)

(defmessage-handler Usuari canvia-festaPrefe (?festa)
   (bind ?self:festaPrefe ?festa)
)

(defmessage-handler Usuari canvia-pasarTemps (?pas)
   (bind ?self:pasarTemps ?pas)
)

(defmessage-handler Usuari canvia-pensar (?pens)
   (bind ?self:pensar ?pens)
)

(defmessage-handler Usuari canvia-pelicules (?peli)
   (bind ?self:pelicules (- ?self:pelicules ?peli))
)