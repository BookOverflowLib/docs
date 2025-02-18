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
  align(center, it)
}
#set text(lang: "it")
#show heading: it => [
  #it
  #v(0.5em)
]

= Introduzione
== Descrizione del prodotto
Il prodotto consiste in una piattaforma web che permette ad ogni utente registrato di accedere ad un numero maggiore di libri, senza dover spendere ulteriore denaro e senza che la loro raccolta di libri occupi sempre più spazio.

Per fare fronte al problema descritto il prodotto si pone come obbiettivo quello di aiutare gli utenti a mettersi in contatto con altri utenti che offrono libri di interesse dei primi e che desiderano libri in possesso dei primi. Inoltre, per fornire un'alternativa allo specificare i libri desiderati, è presente la possiblità di definire dei generi di interesse.

La piattaforma permette anche di esplorare liberamente i libri inseriti nella piattaforma, ovvero quelli che sono stati scelti dagli utenti come offerti o desiderati.


= Progettazione
== Layout
In fase di progettazione si è deciso di adottare un *layout responsive* che permette di variare le caratteristiche layout basandosi su degli intervalli di dimensione della finestra di visualizzazione; questo garantisce un'esperienza di navigazione ottimale su dispositivi con dimensioni e risoluzioni diverse.

Nonostante non sia stata utilizzata la tecnica del *mobile first*, il sito è stato progettato per essere fruibile su dispositivi mobili, tablet e desktop; così facendo abbiamo comunque reso il sito accessibile da dispositivi mobile senza sacrificare il layout desktop.

== Tipologie di utente
Abbiamo individuato le seguenti tipologie di utenti:
- *Utente non registrato*:
  - Può conoscre la piattaforma tramite la pagina iniziale e le pagine di corredo che forniscono uteriori dettagli su di essa;
  - Può visualizzare i libri presenti nella piattaforma tramite la pagina "_esplora_", ma non avrà accesso ai suggerimenti personalizzati in quanto senza un account non è possibile definire i propri interessi; di conseguenza non potrà accedere alle pagine "_match per te_" e "_potrebbe piacerti anche_";
- *Utente registrato*:
  - Può compiere tutte le azioni di un utente non registrato;
  - Può definire i propri interessi, tramite lista dei libri desiderati e/o generi preferiti;
  - Può visualizzare i suggerimenti personalizzati, ovvero "_match per te_" e "_potrebbe piacerti anche_";
  - Può accedere alla funzionalità di scambio, sia come offerente che come richiedente;
  - Può inserire delle recensioni sugli utenti in relazione ad uno scambio.
- *Amministratore*:
  - Può visualizzare gli utenti registrati nella piattaforma;
  - Per ogni utente può viusualizzare gli scambi;
  - Può eliminare gli utenti dalla piattaforma;
  - Può accedere alla pagina "_esplora_" per verificare i libri prensenti nella piattaforma.

== Struttura del sito
Nel sito tutte le pagine utilizzano lo schema a tre pannelli che risponde alle seguenti domande:
- *Dove sono*? Informazione ottenibile tramite il _title_ o la _breadcrumb_;
- *Dove posso andare*? Informazione ottenibile tramite la _navbar_ o il _footer_;
- *Di cosa si tratta*? Informazione ottenibile tramite il _main_, ovvero il contenuto principale della pagina;
Inoltre si trova risposta anche alle seguenti domande:
- *Da chi è gestita questa pagina?* Informazione ottenibile tramite _footer_;
- *Dove posso trovare informazioni più approfondite?* Informazione ottenibile tramite la pagina _come funziona_, pagina sempre raggiungibile tramite _navbar_.

== Frontend
=== Validazione
La validazione lato client viene effettuata tramite HTML, in particolare vengono eseguiti controlli tramite *espressioni regolari* per verificare che i dati inseriti dall'utente rispettino il formato richiesto; viene anche verificato che i campi obbligatori siano stati compilati.
Lo scopo di questa validazione è quello di dare un *feedback* anticipato all'utente in modo che possa correggere eventuali errori prima di inviare i dati al server.

L'implementazione è stata svolta in HTML per questioni di accessibilità, in particolare per favorire una gestione migliore della navigazione tramite screen reader; oltretutto è stata ridotta la dipendenza da JavaScript.\
Questa scelta non ha portato indebolimenti dal punto di vista della sicurezza dato che i controlli vengono comunque eseguiti lato server, inoltre JavaScript è manipolabile lato client tanto quanto l'HTML.


== Backend

=== Routing
Tramite il file .htaccess, abbiamo impostato delle regole per indirizzare tutte le richieste al file index.php, creando un router centrale che gestisce dinamicamente il routing dell'applicazione. Questo approccio ci permette di:
- Nascondere le estensioni dei file (es. .php) garantendo URL puliti e user-friendly
- Gestire tutte le richieste GET attraverso un unico entry-point.
- Implementare errori 404 personalizzati che vengono visualizzati quando si tenta di accedere a pagine non definite nel sistema
- Bloccare l'accesso diretto ai file di configurazione e script PHP, aumentando la sicurezza
=== Connessione al database
Utilizziamo la classe `Database` presente in `src/dbAPI.php` per gestire tutte le query al database ed astrarre le operazioni di connessione e disconnessione.\
La connessione al database viene effettuata durante la costruzione di un'istanza della classe _Database_ e persiste fino alla sua distruzione. \

Il meccanismo di query viene astratto tramite i metodi `query_to_array` e `void_query`, i quali chiamano internamente il metodo `prepare_sql_statement`.\
In questa maniera abbiamo potuto forzare l'uso di *prepared statements* per prevenire attacchi di tipo SQL injection.

Abbiamo deciso di gestire evenutali errori durante l'esecuzione delle query stampando l'eccezione lanciata da _mysqli_ nei log del server, in modo da evitare di mostrare informazioni sensibili all'utente ed al contempo avere messaggi di errore di facile comprensione. \
La maggior parte degli errori mostrati all'utente sono quindi generici e generati altrove, generalmente nel file php che fa uso della classe.\
Nel caso di errori specifici per condizioni che richiedono controlli lato database, come ad esempio la scelta di un username già in uso durante la creazione di un account, abbiamo creato una classe `CustomException` come estensione della classe `Exception`.\
Questo approccio ci consente di distinguere le eccezioni con messaggi personalizzati e di stamparne il messaggio all'utente.
=== Costruzione delle pagine
Il rendering delle pagine avviene interamente in modo dinamico tramite PHP a partire da template HTML.\
I file template (posizionati in `src/templates/`) contengono ancore strutturali sotto forma di commenti HTML dedicati (ad esempio: `<!-- [navbar] -->`) i quali vengono sostituiti con il contenuto dinamico generato dal backend.\
Questo metodo ha vari vantaggi:
- Separazione netta tra struttura e contenuto
- Possibilità di riutilizzare componenti comuni come header e footer
- Gestione corretta degli url tramite la sostituzione automatica di placeholder come <!-- prefix --> con il percorso relativo corretto. il funzionamento di asset statici (CSS, immagini) e link interni anche in percorsi nidificati.
La logica risolve problematiche di routing estremo: in caso di richieste a percorsi non validi con multiple sottodirectory (es. /livello1/livello2/pagina-inesistente), il sistema mantiene la corretta risoluzione dei percorsi nella pagina 404 personalizzata, evitando la rottura dei riferimenti ad asset statici tipica che avverrebbe con un link relativo statico.


= Accessibilità e usabilità
Si è tenuto conto dell'accessibilità e dell'usabilità del sito durante tutta la progettazione e l'implementazione, per garantire un'esperienza di navigazione ottimale a tutti gli utenti, indipendentemente dalle loro capacità.
Nei tre fogli CSS, dedicati alla versione desktop, mobile e stampa, sono state utilizzate misure relative per assicurare che il contenuto rimanga leggibile e accessibile su dispositivi con dimensioni diverse. \
È stato scelto un linguaggio semplice e chiaro per faciliare la comprensione anche da parte di utenti con disabilità cognitive.\
Per l'orientamento dell'utente all'interno del sito è stata inserita una _breadcrumb_ in tutte le pagine, che permette di capire in che punto della gerarchia del sito ci si trova e di tornare alle pagine di livello superiore.
Per gli utenti che navigano tramite screen reader o altri dipositivi di supporto sono presenti aiuti alla navigazione che permettono di saltare direttamente ai contenuti principali della pagina, evitando di dover ascoltare tutto il contenuto come _salta al contenuto_, che permette di saltare direttamente al contenuto principale della pagina. Inoltre, per facilitare l'utente a ritornare all'inizio della pagina è stato inserito un bottone, _scroll to top_ che permette di tornare all'inizio della pagina evitando di dover scorrere nuovamente tutto il contenuto, questo è particolarmente utile per utenti con disabilità motorie e per utenti che navigano tramite dispositivi mobile.\
Sempre tenendo conto degli utenti che navigano tramite screen reader, sono stati utilizzati gli attributi _lang_ per le parole in lingue straniere per consentirne la pronuncia corretta, inoltre sono stati utilizzati gli attributi _aria-label_ per facilitare la comprensione dei vari elementi della pagina, in particolare per la gestione dei messaggi di errore.

L'accessibilità è stata verificata sia manualmente che tramite strumenti automatici come ad esempio _Lighthouse_ di Google Chrome, VoiceOver, Silktide, Wave Evaluation Tool e Stark.\
Per garantire la compatibilità il sito è stato testato su diversi browser come Google Chrome, Mozilla Firefox, Microsoft Edge e Safari.

Non è stata realizzata una site map in quanto il sito presenta una gerachia ampia e poco profonda che abbiamo ritenuto facilemente navigabile.

== Palette colori

La palette colori è stata costruita per garantire un contrasto sufficiente tra i testi e lo sfondo, in modo da garantire una buona leggibilità anche a persone con disturbi visivi.

Per facilitare ulteriormente l'orientamento all'interno del sito e la creazione di una mappa mentale della struttura del sito, i colori dei link e delle pagine visitate sono stati scelti in modo che siano distinguibili tra loro; nella versione chiara i link sono di colore nero o marrone se visitati, mentre nella versione scura sono di colore bianco o marrone se visitati. Siamo consapevoli che la scelta dei colori può non garantire un sufficiente contrasto tra link visitato e non visitato ma abbiamo deciso di mantere tale scelta dando priorità al contrasto tra testo e sfondo e alla coerenza tra i colori del sito.

Per costruire una prima palette di base abbiamo usato #link("https://coolors.co/"), successivamente è stata adattata per essere accessibile e in modo che i colori rispecchino il messaggio trasmesso dall'elemento a cui sono applicati. \
Per verificare l'accessibilità dei colori è stata utilizzata l'estensione #link("https://addons.mozilla.org/en-US/firefox/addon/wcag-contrast-checker/")[WCAG Contrast Checker] che si basa sui requisiti di WCAG 2.2; grazie a questo strumento abbiamo constatato che la nostra palette rispetta il livello WCAG AAA.


= SEO


== Performance
La velocità di caricamento è un fattore fondamentale per migliorare la SERP, per questo abbiamo deciso di compiere le seguenti azioni per migliorare la performance del sito:
- ottimizzazione del caricamento delle immagini comprimendole in formato *.AVIF*, questo permette di ridurre il peso delle immagini mantenendo una qualità discreta;
- utilizzo di font più leggeri in formato *.woff2*;
- *configurato il caricamento delle risorse* in HTML in modo che vengano caricati prima i font e le immagini necessarie per la visualizzazione della pagina;
- utilizzo della clausola *_font-display: swap_* per garantire che il testo sia visibile anche se il font non è ancora stato scaricato;
- utilizzo del tool *Google Lighthouse* per misurare le performance del sito e migliorarle;
