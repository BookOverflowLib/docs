Indirizzo email referente: #link("mailto:lucaribon0203@gmail.com") \
Indirizzo sito #link("https://tecweb.studenti.math.unipd.it/lribon")

= Analisi
== Descrizione del prodotto
Il prodotto consiste in una piattaforma web che permette ad ogni utente registrato di accedere ad un numero maggiore di libri, senza dover spendere ulteriore denaro e senza che la loro raccolta di libri occupi sempre più spazio.

Per fare fronte al problema descritto il prodotto si pone come obbiettivo quello di aiutare gli utenti a mettersi in contatto con altri utenti che offrono libri di interesse dei primi e che desiderano libri in possesso dei primi. Inoltre, per fornire un'aternativa allo specificare i libri desiderati, è presente la possiblità di definire dei generi di interesse.

La piattaforma permette anche di esplorare liberamente i libri disponibili nella piattaforma, ovvero quelli che sono stati scelti dagli utenti come offerti o desiderati.

== Target di utenza
La piattaforma si rivolge a tutti coloro che intendono aggiornare la propria raccolta di libri; inoltre la piattaforma permette di navigare ed eseguire delle ricerche agli utenti nei seguenti casi:
- l'utente sa di preciso cosa cerca, quindi può 
  - popolare la sua lista dei desideri e aggiungere i libri di cui è in possesso alla lista dei libri offerti, e successivamente consultare la pagina "_match per te_" per visualizzare i libri che corrispondono ai suoi desideri e che sono offerti da utenti a cui interessano i libri che l'utente propone;
  - eseguire una ricerca mirata tramite il form di ricerca della pagina "_esplora tutti_".
- l'utente sa vagamente cosa cerca, quindi ha due possibilità:
  - aggiungere i libri in suo possesso alla lista libri offerti e consultare la pagina "_potrebbe piacerti anche_" per visualizzare i libri offerti dagli utenti che sono interessati ai libri proposti dall'utente; 
  - aggiungere i suoi generi preferiti nella piattaforma, e successivamente accedere alla pagina "_esplora tutti_" dove è presente una funzione per filtrare i libri visualizzati usando i suoi generi preferiti;
  - accede alla pagina "_esplora tutti_" e filtrare la ricerca usando i parametri che preferisce.
- l'utente preferisce esplorare in modo ampio i libri disponibili nella piattaforma, quindi può accedere alla pagina "_esplora tutti_" e visualizzare tutti i libri disponibili, eventualmente filtrando la ricerca usando i parametri che preferisce.
- l'utente ha già individuato i libri di suo interesse, quindi può salvare la pagina del libro tramite _bookmark_ dato che l'ISBN del libro viene passato come parametro _GET_.

= Progettazione
== Tipologie di utente
In particolare abbiamo individuato le seguenti tipologie di utenti:
- Utente non registrato:
  - Può conoscre la piattaforma tramite la pagina iniziale e le pagine di corredo che forniscono uteriori dettagli su di essa;
  - Può visualizzare i libri presenti nella piattaforma tramite la pagina "_esplora_", ma non avrà accesso ai suggerimenti personalizzati in quanto senza un account non è possibile definire i propri interessi;
- Utente registrato:
  - Può compiere tutte le azioni di un utente non registrato;
  - Può definire i propri interessi, tramite lista dei libri desiderati e/o generi preferiti;
  - Può visualizzare i suggerimenti personalizzati;
  - Può accedere alla funzionalità di scambio, sia come offerente che come richiedente;
  // TODO: confermare?
  - Può inserire delle recensioni sugli utenti in relazione ad uno scambio;
- Amministratore:
  - Può compiere tutte le azioni di un utente registrato;
  - Può visualizzare gli utenti registrati nella piattaforma;
  // TODO: confermare?
  - Può gestire gli scambi tra utenti della piattaforma;
