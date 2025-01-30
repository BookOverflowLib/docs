#include "front-page.typ"

#set page(
  margin: (top: 4cm, bottom: 4cm, left: 2cm, right: 2cm),
  header: [
    #grid(
      align: horizon,
      columns: (1fr, 1fr),
      align(left)[#image("/assets/imgs/logo.svg", width: 2em)], align(right)[BookOverflow],
    )
    #line(length: 100%, stroke: 0.5pt)
  ],
  numbering: "1",
  footer: [
    #align(center, line(length: 15%))
    #context { align(center, counter(page).display(page.numbering)) }
  ],
)
#counter(page).update(1)
#set page(numbering: "1")
#set par(justify: true, linebreaks: "optimized", first-line-indent: 0.5em)
#set align(left)
#set heading(numbering: "1.")
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  align(center, it)
}
#set text(hyphenate: false)
#show heading: it => [
  #it
  #v(0.5em)
]

= Analisi
== Descrizione del prodotto
Il prodotto consiste in una piattaforma web che permette ad ogni utente registrato di accedere ad un numero maggiore di libri, senza dover spendere ulteriore denaro e senza che la loro raccolta di libri occupi sempre più spazio.

Per fare fronte al problema descritto il prodotto si pone come obbiettivo quello di aiutare gli utenti a mettersi in contatto con altri utenti che offrono libri di loro interesse e che desiderano libri in possesso dei primi. Inoltre, per fornire un'alternativa allo specificare i libri desiderati, è presente la possiblità di definire dei generi di interesse.

La piattaforma permette anche di esplorare liberamente i libri disponibili nella piattaforma, ovvero quelli che sono stati scelti dagli utenti come offerti o desiderati.

== Target di utenza
La piattaforma si rivolge a tutti coloro che intendono aggiornare la propria raccolta di libri; inoltre la piattaforma permette di navigare ed eseguire delle ricerche agli utenti nei seguenti casi:
- l'*utente sa di preciso cosa cerca*, quindi può
  - popolare la sua lista dei desideri e aggiungere i libri di cui è in possesso alla lista dei libri offerti, e successivamente consultare la pagina "_match per te_" per visualizzare i libri che corrispondono ai suoi desideri e che sono offerti da utenti a cui interessano i libri che l'utente propone;
  - eseguire una ricerca mirata tramite il form di ricerca della pagina "_libri offerti_".
- l'*utente sa vagamente cosa cerca*, quindi ha due possibilità:
  - aggiungere i libri in suo possesso alla lista libri offerti e consultare la pagina "_potrebbe piacerti anche_" per visualizzare i libri offerti dagli utenti che sono interessati ai libri proposti dall'utente;
  - aggiungere i suoi generi preferiti nella piattaforma, e successivamente accedere alla pagina "_libri offerti_" dove è presente una funzione per filtrare i libri visualizzati usando i suoi generi preferiti;
  - accede alla pagina "_libri offerti_" e filtrare la ricerca usando i parametri che preferisce.
- l'*utente preferisce esplorare* in modo ampio i libri disponibili nella piattaforma, quindi può accedere alla pagina "_libri offerti_" e visualizzare tutti i libri disponibili, eventualmente filtrando la ricerca usando i parametri che preferisce.
- l'*utente ha già individuato* i libri di suo interesse, quindi può salvare la pagina del libro tramite _bookmark_ dato che l'ISBN del libro viene passato come parametro _GET_.

Si prevede un utilizzo tramite dispositivi con performance e dimensioni del display varie, quindi la piattaforma è stata progettata per essere responsive e performante sulla maggior parte dei dispositivi non considerati obsoleti.

== Funzionalità
=== Registrazione e accesso
La piattaforma offre agli utenti la possibilità di registrarsi per accedere a sezioni e funzionalità personalizzate.\
Una volta completata la registrazione, gli utenti potranno effettuare il login utilizzando il proprio username o email, accompagnati da una password.\
È inoltre prevista la possibilità di disconnettersi dal proprio account o di eliminarlo in modo permanente.\
=== Personalizzazione dell'esperienza
La piattaforma consente agli utenti di personalizzare la propria esperienza attraverso la definizione di interessi specifici, tra cui l'inserimento di libri nella lista dei desideri e l'indicazione dei generi letterari preferiti.

Gli utenti possono inoltre catalogare i volumi già in loro possesso e quelli che intendono mettere a disposizione per lo scambio, creando così un inventario personale consultabile in qualsiasi momento.\
=== Ricerca e visualizzazione dei libri
Il sistema offre la possibilità di consultare l'elenco completo dei libri registrati dagli utenti, comprendente sia le opere ricercate che quelle disponibili per lo scambio.

Per una navigazione ottimale, la piattaforma propone un sistema di suggerimenti personalizzati basato sui generi preferiti, sui titoli desiderati e sull'offerta disponibile dell'utente.\

La funzionalità di ricerca permette infine di esplorare il catalogo liberamente.\
È possibile effettuare ricerche per titolo, autore o ISBN. È infine prevista la possibilità di filtrare i risultati in base ai propri generi letterari preferiti.\
=== Scambi
Se un utente è in possesso di un libro desiderato da un altro utente, può inviare una proposta di scambio.\
L'utente ricevente potrà decidere se accettare o rifiutare la proposta attraverso un apposita interfaccia dedicata.
=== Recensioni
Al termine di uno scambio, gli utenti possono lasciare una recensione sull'esperienza. Il sistema di feedback permette sia a chi offre che a chi accetta lo scambio di condividere la propria opinione, aiutando così gli altri utenti a scegliere con chi scambiare

= Progettazione
== Layout
In fase di progettazione si è deciso di adottare un *layout responsive* che permette di variare le caratteristiche layout basandosi su degli intervalli di dimensione della finestra di visualizzazione; questo garantisce un'esperienza di navigazione ottimale su dispositivi con dimensioni e risoluzioni diverse.

Nonostante non sia stata utilizzata la tecnica del *mobile first*, il sito è stato progettato per essere fruibile su dispositivi mobili, tablet e desktop; così facendo abbiamo comunque reso il sito accessibile da dispositivi mobile senza sacrificare il layout desktop.

== Tipologie di utente
Abbiamo individuato le seguenti tipologie di utenti:
- Utente non registrato:
  - Può conoscre la piattaforma tramite la pagina iniziale e le pagine di corredo che forniscono uteriori dettagli su di essa;
  - Può visualizzare i libri presenti nella piattaforma tramite la pagina "_esplora_", ma non avrà accesso ai suggerimenti personalizzati in quanto senza un account non è possibile definire i propri interessi.
- Utente registrato:
  - Può compiere tutte le azioni di un utente non registrato;
  - Può definire i propri interessi, tramite lista dei libri desiderati e/o generi preferiti;
  - Può visualizzare i suggerimenti personalizzati;
  - Può accedere alla funzionalità di scambio, sia come offerente che come richiedente;
  // TODO: confermare?
  - Può inserire delle recensioni sugli utenti in relazione ad uno scambio.
- Amministratore:
  - Può compiere tutte le azioni di un utente registrato;
  - Può visualizzare gli utenti registrati nella piattaforma;
  // TODO: confermare?
  - Può gestire gli scambi tra utenti della piattaforma.

== Base di dati
// TODO: schema fatto bene con comune collegato?
La base di dati è composta dalle seguenti tabelle:
- *Utente*
  - email: chiave primaria
  - password_hash: hash della password dell'utente che comprende anche il salt
  - username: nome utente univoco
  - nome
  - cognome
  - provincia
  - comune
  - path_immagine: percorso all'immagine del profilo
  - generi_preferiti: generi letterari preferiti dall'utente
- *Libro*
  - ISBN: chiave primaria, è un _VARCHAR(50)_ poiché Google Books API certe volte restituisce un ISBN non standard quindi per evitare il fallimento dell'inserimento abbiamo reso meno restrittiva la lunghezza
  - titolo
  - autore
  - editore
  - anno: anno di pubblicazione
  - genere
  - descrizione
  - lingua
  - path_copertina: percorso all'immagine di copertina
- *Copia*
  - ID: usato come chiave primaria in modo che un utente possa avere più copie dello stesso ISBN (cosa non possibile se usassimo (ISBN, proprietario) come chiave primaria); viene usato un _AUTO_INCREMENT_ per garantire l'unicità
  - ISBN: chiave esterna che fa riferimento a Libro
  - proprietario: chiave esterna che fa riferimento a Utente
  - disponibile: _BOOLEAN_ che rappresenta lo stato di disponibilità allo scambio della copia, utile per indicare un libro che era nella lista dell'utente ma che è stato scambiato
  - condizioni: _ENUM('nuovo', 'come nuovo', 'usato ma ben conservato', 'usato', 'danneggiato')_ che rappresenta lo stato di usura della copia
- *Desiderio*
  - email, ISBN: chiave primaria composta, chiavi esterne che si riferiscono rispettivamente Utente e Libro
- *Scambio*
  - ID: chiave primaria, viene usato un _AUTO_INCREMENT_ per garantire l'unicità
  - emailProponente: identifica l'utente che propone lo scambio, chiave esterna che fa riferimento a Utente
  - emailAccettatore: identifica l'utente che riceve la proposta di scambio, chiave esterna che fa riferimento a Utente
  - idCopiaProp, idCopiaAcc: rappresentano rispettivamente la copia fisica offerta da chi propone lo scambio e la copia fisica offerta da chi riceve la proposta; chiavi esterne che fanno riferimento a Copia
  - dataProposta, dataConclusione: date di proposta e conclusione (la conclusione avviene in caso di accettazione o rifiuto) dello scambio; dataProposta ha _CURRENT_DATE_ come default per semplficare l'inserimento
  - stato: _ENUM('in attesa', 'accettato', 'rifiutato')_ che rappresenta lo stato dello scambio
- *Recensione*
  - emailRecensito: identificatore dell'utente che riceve la recensione; chiave esterna che fa riferimento a Utente
  - idScambio: identificatore dello scambio a cui si riferisce la recensione; chiave esterna che fa riferimento a Scambio
  - dataPubblicazione: data di pubblicazione della recensione, ha _CURRENT_DATE_ come default per semplficare l'inserimento
  - valutazione: valore intero (usiamo _TINYINT_ per ottimizzare lo spazio occupato) compreso tra 1 e 5
  - contenuto: testo della recensione; colonna di tipo _TEXT_ per permettere la scrittura di recensioni di lunghezza variabile fino a 65,535 caratteri, questo non rappresenta un problema perché la documentazione di MySQL (di cui MariaDB è un fork) indica che le stringhe di lunghezza variabile allocano solo lo spazio effettivamente occupato

C'è poi un secondo schema che è stato utilizzato per la gestione delle posizioni geografiche, che è composto dalle seguenti tabelle:
- regioni
- province
- comuni
// TODO: confermare?
Abbiamo deciso di non integrare quest'ultimo nello schema principale perché viene utilizzato solamente per ottenere un elenco di province e comuni da usare nel form di registrazione quindi abbiamo preferito non complicare ulteriormente la struttura dello schema principale.

== Struttura del sito
Nel sito tutte le pagine utilizzano lo schema a tre pannelli che risponde alle seguenti domande:
- *Dove sono*? Informazione ottenibile tramite il _title_ o la _breadcrumb_;
- *Dove posso andare*? Informazione ottenibile tramite la _navbar_;
- *Di cosa si tratta*? Informazione ottenibile tramite il _main_, ovvero il contenuto principale della pagina;
=== Header
L'header è composto da:
- *Logo*: il logo del sito;
- *Titolo*: il nome del sito;
- *Navbar*: contiene i collegamenti alle pagine principali del sito, ovvero _home_, _esplora_ e _come funziona_;
- *Switch tema*: permette di cambiare il tema del sito tra chiaro e scuro;
- *Accesso*: contiene il collegamenta alla pagina _accedi_ se l'utente non è autenticato, altrimenti contiene il collegamento al _profilo_;
=== Breadcrumb
La breadcrumb è presente in tutte le pagine del sito e permette all'utente di capire in che punto della gerarchia del sito si trova e alle pagine di livello superiore.
=== Footer
Il footer è composto da dei link ad altre pagine del sito, logo e nome del sito, ulteriori informazioni riguardo al sito e gli autori del sito.
=== Home
È la *landing page* del sito, contiene una breve descrizione del servizio offerto, una lista che mostra alcuni dei libri più scambiati ed un collegamento ulteriore alla pagina di accesso.
=== Esplora
Questa pagina mostra le diverse opzioni di ricerca e visualizzazione dei libri presenti nella piattaforma; in particolare permette di accedere alla pagina _libri offerti_ a utenti registrati e non, e alle pagine _match per te_ e _potrebbe piacerti anche_ solo agli utenti registrarti.
==== Match per te
Questa pagina permette di visualizzare i libri che corrispondono ai desideri dell'utente e che sono offerti da altri utenti a cui interessano i libri offerti dall'utente che esegue la ricerca.
==== Potrebbe piacerti anche
Questa pagina permette di visualizzare i libri offerti dagli utenti che sono interessati ai libri proposti dall'utente che esegue la ricerca; questa pagina non contiene solo i libri che corrispondono ai desideri dell'utente ma tutti quelli che rispettano la condizione precedentemente definita in modo che l'utente possa considerare anche libri che non conosce e che quindi non ha inserito nella lista dei desideri.
==== Libri Offerti
Questa pagina permette di visualizzare tutti i libri presenti nella piattaforma, e di filtrarli usando diversi parametri.
// TODO: confermare
Gli utenti registrati possono filtrare i libri usando i generi preferiti tramite un apposito bottone.
==== Libri più scambiati
Questa pagina permette di visualizzare i libri più scambiati nella piattaforma, è accessibile sia come utenti registrati che non.
=== Come funziona
Pagina che fornisce ulteriori dettagli riguardo ad obbiettivi, vantaggi e una breve spiegazione del funzionamento della piattaforma. \
Include anche un collegamento alla pagina di accesso.
=== Libro
Questa pagina permette di visualizzare i dettagli di uno specifico libro, inoltre permette di visualizzare e di proporre uno scambio con gli utenti che possiedono una copia del libro.
=== Accedi
Questa pagina permette agli utenti di accedere alla piattaforma tramite username o email e password.
=== Registrati
Questa pagina permette agli utenti di registrarsi alla piattaforma, inserendo i dati richiesti ovvero: nome, cognome, provincia e comune dove ci si trova, username, email, password e conferma della password.
=== Profilo
Se il profilo visualizzato non è quello dell'utente autenticato allora la pagina permette di:
- visualizzare nome, cognome, posizione geografica, media delle valuazioni e immagine del profilo;
- visualizzare i generi preferiti;
- visualizzare i libri offerti e desiderati dall'utente;
- contattare l'utente tramite email;
Altrimenti la pagina permette di:
- visualizzare nome, cognome, posizione geografica, media delle valuazioni e immagine del profilo;
- visualizzare i generi preferiti;
- visualizzare i libri offerti e desiderati dall'utente;
// TODO: confermare
- accedere alla pagina di modifica del profilo;
- accedere alla pagina di modifica dei generi;
- accedere alla pagina _i tuoi scambi_;
- accedere alla pagina di modifica delle liste;
- uscire dall'account;
// TODO: confermare
- eliminare l'account;
A fine pagina è presente anche una call to action che invita ad esplorare le possibilita di scambio.
==== Modifica generi
Questa pagina permette di visualizzare e scegliere i propri generi preferiti.
==== Modifica liste
// TODO: confermare modifica disponibilità
Le pagine di modifica delle liste permettono di visualizzare tutti i libri di quella lista, modificare la disponibilità di quelli presenti, di aggiungerli o eliminarli dalla lista.
==== I tuoi scambi
Questa pagina permette di visualizzare tutti gli scambi in cui l'utente è coinvolto, sia come proponente che come ricevente.

Se l'utente è il proponente può annullare gli scambi in corso, se l'utente è il ricevente può accettare o rifiutare gli scambi in corso.
=== 404
Questa pagina viene visualizzata quando l'utente tenta di accedere ad una pagina che non esiste, contiene un messaggio di errore e un collegamento alla pagina iniziale.
=== 500
Questa pagina viene visualizzata quando si verifica un errore interno al server, contiene un messaggio di errore e un collegamento alla pagina iniziale.


= Implementazione
== Organizzazione del lavoro
Per la realizzazione del progetto è stato utilizzato un *repository su GitHub*, in cui sono presenti la *branch* main e diverse feature branch. Per la gestione dell'infrastruttura utilizzata per testare il progetto in locale è stato utilizzato un file *Docker Compose* assieme ad un *Dockerfile*, il secondo è stato usato per configurare alcuni parametri non gestibili tramite il Docker Compose.

Il lavoro è stato suddiviso nel seguente modo:
- Aleena Mathew:
  - Progettazione dell'interfaccia grafica;
  - Realizzazione dell'interfaccia grafica tramite HTML e CSS;
  - Realizzazione dei layout di stampa;
  - Ideazione dei contenuti testuali e delle immagini;
  - Stesura della relazione;
- Alessandro Bernardello:
  - Progettazione del database;
  - Implementazione del database;
  - Implementazione delle API del database;
  - Implementazione del routing delle pagine;
  - Implementazione del backend delle pagine riguardante l'interazione con il database e relativi controlli;
  - Ottimizzazione delle immagini;
  - Stesura della relazione;
- Luca Ribon:
  - Progettazione dell'interfaccia grafica;
  - Progettazione del database;
  - Implementazione del database;
  - Implementazione delle API del database;
  - Implementazione del backend delle pagine riguardante l'interazione con il database e relativi controlli;
  - Stesura della relazione;
- Matteo Bazzan:
  - Progettazione dell'interfaccia grafica;
  - Realizzazione dell'interfaccia grafica tramite HTML e CSS;
  - Implementazione delle API del database;
  - Implementazione del routing delle pagine;
  - Implementazione del backend delle pagine riguardante l'interazione con il database e relativi controlli;
  - Implementazione degli script JavaScript per la gestione dei componenti grafici;
  - Stesura della relazione;
Tutti i membri del gruppo hanno contribuito all'implementazione e/o alla verifica dell'accessibilità del sito.

== Frontend
=== Validazione
La validazione lato client viene effettuata tramite HTML, in particolare vengono eseguiti controlli tramite *espressioni regolari* per verificare che i dati inseriti dall'utente rispettino il formato richiesto; viene anche verificato che i campi obbligatori siano stati compilati.
Lo scopo di questa validazione è quello di dare un *feedback* anticipato all'utente in modo che possa correggere eventuali errori prima di inviare i dati al server.

L'implementazione è stata svolta in HTML per questioni di accessibilità, in particolare per favorire una gestione migliore della navigazione tramite screen reader; oltretutto è stata ridotta la dipendenza da JavaScript.\
Questa scelta non ha portato indebolimenti dal punto di vista della sicurezza dato che i controlli vengono comunque eseguiti lato server, inoltre JavaScript è manipolabile lato client tanto quanto l'HTML.
=== Stampa
Per ogni pagina viene incluso un layout di stampa, che riorganizza le informazioni principali dalla pagina sistemandole in un formato adeguato, principamente rimuovendo i colori di background non necessari per la stampa. 
== Backend
=== Validazione
=== Connessione al database


= Accessibilità e usabilità
== Palette colori
La palette colori è stata costruita per garantire un contrasto sufficiente tra i testi e lo sfondo, in modo da garantire una buona leggibilità anche a persone con disturbi visivi.

Per costruire una prima palette di base abbiamo usato #link("https://coolors.co/"), successivamente è stata adattata per essere accessibile e in modo che i colori rispecchino il messaggio trasmesso dall'elemento a cui sono applicati. \
Per verificare l'accessibilità dei colori è stata utilizzata l'estensione #link("https://addons.mozilla.org/en-US/firefox/addon/wcag-contrast-checker/")[WCAG Contrast Checker] che si basa sui requisiti di WCAG 2.2; grazie a questo strumento abbiamo constatato che la nostra palette rispetta il livello WCAG AAA.

== Font
// TODO: https://grtcalculator.com/ ???

== Compatibilità

= SEO
== Scelta di keyword e description
Lo scopo principale della piattaforma è quello di scambiare libri tra utenti, e attualmente, per questioni di implementazione, ci si rivolge all'utenza nel territorio italiano, per questo le *keyword scelte* sono: "scambio libri in Italia, libri, scambio, libri Italia, trova libri, BookOverflow".

Per il tag *description* invece abbiamo individuato "BookOverflow è un sito web che
permette di scambiare libri con altri utenti in Italia, trova subito il tuo prossimo scambio." che racchiude diverse keyword e una *call to action* stando al di sotto dei 150 caratteri.

== Performance
La velocità di caricamento è un fattore fondamentale per migliorare la SERP, per questo abbiamo deciso di compiere le seguenti azioni per migliorare la performance del sito:
- ottimizzazione del caricamento delle immagini comprimendole in formato *.AVIF*, questo permette di ridurre il peso delle immagini mantenendo una qualità discreta;
- utilizzo di font più leggeri in formato *.woff2*;
- *configurato il caricamento delle risorse* in HTML in modo che vengano caricati prima i font e le immagini necessarie per la visualizzazione della pagina;
- utilizzo della clausola *_font-display: swap_* per garantire che il testo sia visibile anche se il font non è ancora stato scaricato;
- utilizzo del tool *Google Lighthouse* per misurare le performance del sito e migliorarle;
Non abbiamo minimizzato i file CSS e JavaScript perché la consegna richiede esplicitamente di non farlo.

== Indicizzazione e alberatura
Abbiamo utilizzato il file *robots.txt* per evitare che vengano indicizzati file contenenti dati sensibili, configurazioni, e script che vengono usati solo come utility.

Per quanto riguarda l'alberatura del sito è stata tenuta il più possibile piatta mantenendo un livello di prondità massimo di 3 livelli.

= Altre motiviazioni progettuali
== Warning nel console log
