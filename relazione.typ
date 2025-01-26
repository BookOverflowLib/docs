Indirizzo email referente: #link("mailto:lucaribon0203@gmail.com") \
Indirizzo sito #link("https://tecweb.studenti.math.unipd.it/lribon")

= Analisi
== Descrizione del prodotto
Il prodotto consiste in una piattaforma web che permette ad ogni utente registrato di accedere ad un numero maggiore di libri, senza dover spendere ulteriore denaro e senza che la loro raccolta di libri occupi sempre più spazio.

Per fare fronte al problema descritto il prodotto si pone come obbiettivo quello di aiutare gli utenti a mettersi in contatto con altri utenti che offrono libri di interesse dei primi e che desiderano libri in possesso dei primi. Inoltre, per fornire un'aternativa allo specificare i libri desiderati, è presente la possiblità di definire dei generi di interesse.

La piattaforma permette anche di esplorare liberamente i libri disponibili nella piattaforma, ovvero quelli che sono stati scelti dagli utenti come offerti o desiderati.

== Target di utenza
La piattaforma si rivolge a tutti coloro che intendono aggiornare la propria raccolta di libri; inoltre la piattaforma permette di navigare ed eseguire delle ricerche agli utenti nei seguenti casi:
- l'*utente sa di preciso cosa cerca*, quindi può
  - popolare la sua lista dei desideri e aggiungere i libri di cui è in possesso alla lista dei libri offerti, e successivamente consultare la pagina "_match per te_" per visualizzare i libri che corrispondono ai suoi desideri e che sono offerti da utenti a cui interessano i libri che l'utente propone;
  - eseguire una ricerca mirata tramite il form di ricerca della pagina "_esplora tutti_".
- l'*utente sa vagamente cosa cerca*, quindi ha due possibilità:
  - aggiungere i libri in suo possesso alla lista libri offerti e consultare la pagina "_potrebbe piacerti anche_" per visualizzare i libri offerti dagli utenti che sono interessati ai libri proposti dall'utente;
  - aggiungere i suoi generi preferiti nella piattaforma, e successivamente accedere alla pagina "_esplora tutti_" dove è presente una funzione per filtrare i libri visualizzati usando i suoi generi preferiti;
  - accede alla pagina "_esplora tutti_" e filtrare la ricerca usando i parametri che preferisce.
- l'*utente preferisce esplorare* in modo ampio i libri disponibili nella piattaforma, quindi può accedere alla pagina "_esplora tutti_" e visualizzare tutti i libri disponibili, eventualmente filtrando la ricerca usando i parametri che preferisce.
- l'*utente ha già individuato* i libri di suo interesse, quindi può salvare la pagina del libro tramite _bookmark_ dato che l'ISBN del libro viene passato come parametro _GET_.

Si prevede un utilizzo tramite dispositivi con performance e dimensioni del display varie, quindi la piattaforma è stata progettata per essere responsive e performante sulla maggior parte dei dispositivi non considerati obsoleti.

== Funzionalità
=== Registrazione e accesso
La piattaforma permette agli utenti di registrarsi se lo desiderano, dopo aver compiuto la registrazione potranno accedere a sezioni e funzionalità personalizzate.\
Dopo aver completato la registrazione gli utenti potranno accedere tramite username o email, e password. \ Inoltre sarà possibile uscire dall'account o eliminarlo completamente.
=== Personalizzazione dell'esperienza
La piattaforma permette agli utenti di definire i propri interessi, tramite la lista dei libri desiderati e/o i generi preferiti.

Inoltre viene data la possibilità di definire i libri in possesso e quelli che si intendono offrire in scambio.
=== Ricerca e visualizzazione dei libri
La piattaforma permette agli utenti di visualizzare i libri registrati, ovvero quelli che gli utenti desiderano o offrono in scambio. Se sono definiti generi preferiti, libri desiderati e libri offerti sarà possibile visualizzare i suggerimenti personalizzati.

Inoltre è possibile esplorare i libri presenti nella piattaforma tramite la funzione di ricerca che prevede anche l'utilizzo di filtri.
=== Scambi
È possibile avviare uno scambio con un utente se siamo in possesso di un libro che l'utente desidera. L'utente che riceve la proposta di scambio potrà decide se accettarla o meno.
=== Recensioni
Gli utenti possono inserire delle recensioni sugli altri utenti in relazione ad uno scambio, sia come proponenti che come riceventi della richiesta di scambio.


= Progettazione
== Layout
In fase di progettazione si è deciso di adottare un *layout responsive* che permette di variare le caratteristiche layout basandosi su degli intervalli di dimensione della finestra di visualizzazione; questo garantisce un'esperienza di navigazione ottimale su dispositivi con dimensioni e risoluzioni diverse.

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

== Struttura del sito
=== Home
=== Esplora
==== Esplora tutti
==== Match per te
==== Potrebbe piacerti anche
=== Come funziona
=== Libro
=== Profilo
==== Modifica liste
==== Modifica generi
==== I tuoi scambi
=== Header
=== Breadcrumb
=== Footer

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
  - Implementazion del backend delle pagine riguardante interazione con il database e relativi controlli;
  - Ottimizzazione delle immagini;
  - Stesura della relazione;
- Luca Ribon:
  - Progettazione dell'interfaccia grafica;
  - Progettazione del database;
  - Implementazione del database;
  - Implementazione delle API del database;
  - Implementazion del backend delle pagine riguardante interazione con il database e relativi controlli;
  - Stesura della relazione;
- Matteo Bazzan:
  - Progettazione dell'interfaccia grafica;
  - Realizzazione dell'interfaccia grafica tramite HTML e CSS;
  - Implementazione delle API del database;
  - Implementazione del routing delle pagine;
  - Implementazion del backend delle pagine riguardante interazione con il database e relativi controlli;
  - Implementazione degli script JavaScript per la gestione dei componenti grafici;
  - Stesura della relazione;
Tutti i membri del gruppo hanno contribuito all'implementazione e/o alla verifica dell'accessibilità del sito.

== Frontend

== Backend


= Accessibilità e usabilità


= SEO
== Scelta di keyword e description
Lo scopo principale della piattaforma è quello di scambiare libri tra utenti, e attualmente, per questioni di implementazione, ci si rivolge all'utenza nel territorio italiano, per questo le *keyword scelte* sono: "scambio libri in Italia, libri, scambio, libri Italia, trova libri, BookOverflow".

Per il tag *description* invece abbiamo individuato "BookOverflow è un sito web che
permette di scambiare libri con altri utenti in Italia, trova subito il tuo prossimo scambio." che racchiude diverse keyword e una *call to action* stando al di sotto dei 150 caratteri. 

== Utilizzo delle intestazioni

== Velocità di caricamento
=== Ottimizzazione del caricamento delle immagini
Per migliorare del performance si è deciso di comprimere le immagini convertendole in formato .AVIF, questo permette di ridurre il peso delle immagini mantenendo una qualità discreta.

== Citazioni

== Alberatura

= Motivazioni delle scelte progettuali
