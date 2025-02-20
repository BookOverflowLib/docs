#include "front-page-caa.typ"

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
#show link: underline
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
== Perchè BookOverflow
BookOverflow è il posto dove i libri non finiscono mai. Come #link("https://stackoverflow.com/")[_StackOverflow_] per i programmatori, qui gli amanti della lettura trovano un "overflow" di storie, connessioni e possibilità, tutto senza spendere un euro.

La bellezza di BookOverflow risiede nel suo potere di trasformare libri dimenticati sugli scaffali in opportunità, inoltre si impegna a ridurre l'impatto ambientale dell'industria editoriale, incentivando pratiche *sostenibili*.
== Descrizione del prodotto
BookOverflow è una piattaforma web che permette agli utenti registrati di accedere a una vasta selezione di libri in modo gratuito e risolve il problema dell'accumulo di libri negli scaffali.

L’obiettivo principale è *facilitare gli scambi tra utenti*: chi cerca un libro specifico può trovare chi lo possiede e, viceversa, chi offre un libro può connettersi con chi è interessato a riceverlo. Per semplificare la ricerca, gli utenti possono:

- Indicare libri desiderati o generi preferiti (es. fantascienza, romanzi storici), evitando di selezionare manualmente ogni titolo.

- Esplorare liberamente tutti i libri disponibili sulla piattaforma, sia quelli offerti per lo scambio che quelli cercati da altri utenti.

In questo modo, la piattaforma unisce praticità, risparmio e personalizzazione, rendendo gli scambi di libri accessibili a tutti.


= Scelte Progettuali
== Layout
In fase di progettazione si è deciso di adottare un *layout responsive* che permette di variare le caratteristiche layout basandosi su degli intervalli di dimensione della finestra di visualizzazione; questo garantisce un'esperienza di navigazione ottimale su dispositivi con dimensioni e risoluzioni diverse.

Il sito è stato testato per essere fruibile su dispositivi mobili, tablet e desktop.
== Validazione lato client
La validazione lato client viene effettuata tramite HTML, in particolare vengono eseguiti controlli tramite *espressioni regolari* per verificare che i dati inseriti dall'utente rispettino il formato richiesto; viene anche verificato che i campi obbligatori siano stati compilati.
Lo scopo di questa validazione è quello di dare un *feedback* anticipato all'utente in modo che possa correggere eventuali errori prima di inviare i dati al server.

L'implementazione è stata svolta in HTML per questioni di accessibilità, in particolare per favorire una gestione migliore della navigazione tramite screen reader; oltretutto è stata ridotta la dipendenza da JavaScript.

Questa scelta non ha portato indebolimenti dal punto di vista della sicurezza dato che i controlli vengono comunque eseguiti lato server, inoltre JavaScript è manipolabile lato client tanto quanto l'HTML.
== Ricerca libri
La ricerca dei libri da aggiungere alle liste, utilizza le Google Books API; per fornire all'utente una *ricerca automatica* e immediata abbiamo deciso di implementare un meccanismo di _auto-fetching_ basato su un *timer* che viene fatto partire nel momento in cui l'utente smette di digitare per più di 600 millisecondi.

In questo modo evitiamo un numero eccessivo di richieste alle API e soprattutto il contenuto non viene aggiornato troppo velocemente causando un *sovraccarico cognitivo* dell'utente.

Per migliorare l'usabilità e l'accessibilità di questa ricerca automatica per gli utenti che utilizzano screen reader è stato aggiunto un _alert_ che viene che notifica all'utente la ricezione dei risultati della sua ricerca.


= Accessibilità e usabilità
Si è tenuto conto dell'accessibilità e dell'usabilità del sito durante tutta la progettazione e l'implementazione, per garantire un'esperienza di navigazione ottimale a tutti gli utenti, indipendentemente dalle loro capacità.

Nei tre fogli *CSS*, *dedicati* alla versione *desktop, mobile e stampa*, sono state utilizzate misure relative per assicurare che il contenuto rimanga leggibile e accessibile su dispositivi con dimensioni diverse.

È stato scelto un linguaggio semplice e chiaro per faciliare la comprensione anche da parte di utenti con disabilità cognitive.

Per l'orientamento dell'utente all'interno del sito è stata inserita una *_breadcrumb_* in tutte le pagine, che permette di capire in che punto della gerarchia del sito ci si trova e di tornare alle pagine di livello superiore. 

Per gli utenti che navigano tramite *screen reader o altri dipositivi di supporto* sono presenti aiuti alla navigazione che permettono di saltare direttamente ai contenuti principali della pagina, evitando di dover ascoltare tutto il contenuto come il bottone _salta al contenuto_.\ 
Inoltre, per facilitare l'utente a ritornare all'inizio della pagina è stato inserito un bottone, _scroll to top_ che permette di tornare all'inizio della pagina evitando di dover scorrere nuovamente tutto il contenuto.

Sempre tenendo conto degli utenti che navigano tramite screen reader, sono stati utilizzati gli attributi _lang_ per le parole in lingue straniere per consentirne la pronuncia corretta, inoltre sono stati utilizzati gli attributi *_aria-label_* per facilitare la comprensione dei vari elementi della pagina, in particolare per la gestione dei messaggi di errore.

Non è stata realizzata una site map in quanto il sito presenta una gerachia ampia e poco profonda che abbiamo ritenuto facilemente navigabile.
== Palette colori

La palette colori è stata costruita per garantire un *contrasto* sufficiente tra i testi e lo sfondo, in modo da garantire una buona leggibilità anche a persone con disturbi visivi. 

Per rendere i *link riconoscibili* vengono tutti sottolineati all'evento _hover_

Per facilitare ulteriormente l'orientamento all'interno del sito e la creazione di una mappa mentale della struttura del sito, i colori dei link e delle pagine visitate sono stati scelti in modo che siano distinguibili tra loro; nella versione chiara i link sono di colore nero o marrone se visitati, mentre nella versione scura sono di colore bianco o marrone se visitati.\
Inoltre, si è deciso di sottolineare tutti i link non visitati per garantire un sufficiente contrasto tra link visitato e non visitato quando viene utilizzato il tema chiaro. 

Per costruire una prima palette di base abbiamo usato #link("https://coolors.co/"), successivamente è stata adattata per essere accessibile e in modo che i colori rispecchino il messaggio trasmesso dall'elemento a cui sono applicati. \
Per verificare l'accessibilità dei colori è stata utilizzata l'estensione #link("https://addons.mozilla.org/en-US/firefox/addon/wcag-contrast-checker/")[*WCAG Contrast Checker*] che si basa sui requisiti di WCAG 2.2; grazie a questo strumento abbiamo constatato che la nostra palette rispetta il livello WCAG AAA.
== Font
Abbiamo scelto i font nel il catalogo di #link("https://fonts.google.com/")[Google Font], in particolare è stato scelto *Onest* come font _sans-serif_, e *Gentium Book Plus* come font _serif_ per la pagina e per il logo.

Per garantire un’esperienza visiva armoniosa e accessibile, le dimensioni dei font sono state definite utilizzando GRTCalculator, uno strumento che applica il principio della sezione aurea (≈ 1:1.618). Questa scelta progettuale si basa su tre pilastri:
- *Armonia estetica*: è una proporzione matematicamente bilanciata, storicamente associata a forme piacevoli alla percezione umana. Crea una gerarchia tipografica coerente, dove titoli, sottotitoli e corpo del testo si relazionano in modo naturale, migliorando l’estetica generale del sito.

- *Leggibilità e accessibilità*: garantisce che le proporzioni mantengano un contrasto adeguato tra testo e sfondo, rispettando i criteri WCAG.

- *Responsività e coerenza*: il design rimane coerente anche su schermi con risoluzioni diverse. Questo approccio elimina la necessità di regolazioni manuali, ottimizzando il workflow di sviluppo.

Per salvaguardare la compatibilità è stata usata la regola:
```css
@supports not (font-size: clamp(1rem, 1vi, 1rem))
```
nel caso in cui il browser non supporti la funzione clamp, la dimensione del font viene impostata in modo statico.
== Compatibilità
Per garantire la *compatibilità* il sito è stato testato su diversi sistemi operativi e browser, compresi quelli più diffusi attualmente.


= Testing
L'accessibilità è stata verificata sia manualmente che tramite strumenti automatici come ad esempio _Lighthouse_ di Google Chrome, _VoiceOver_, _Silktide_, _Wave Evaluation Tool_ e _Stark Accessibility Checker_.
== Google Lighthouse
Per verificare la qualità del progetto dal punto di vista della SEO abbiamo usato il tool *Google Lighthouse*.
In questo modo abbiamo ottenuto una valutazione per le seguenti cateogrie:
- *Performance*: in ogni pagina otteniamo un punteggio maggiore o uguale a 90 sia nella modalità desktop che in quella mobile;
- *Accessibility*: in ogni pagina otteniamo un punteggio maggiore o uguale a 98 sia nella modalità desktop che in quella mobile;
- *Best Practice*: in ogni pagina otteniamo un punteggio maggiore o uguale a 100 sia nella modalità desktop che in quella mobile;\  
  Facciamo notare che il punteggio visualizzato è più basso quando il sito viene ospitato nel server del dipartimento a causa dell'utilizzo del protocollo _HTTP_ (e non _HTTPS_) su una porta diversa da `80`
- *SEO*: in ogni pagina otteniamo un punteggio maggiore o uguale a 100 sia nella modalità desktop che in quella mobile;
Di seguito una foto raffigurante i punteggi ottenuti durante i test eseguiti in locale, dove l'unica differenza rispetto al server fornito dall'Università è che viene _bypassato_ il controllo per l'utilizzo di HTTPS:
#figure(
  image("assets/imgs/homeLighthouse-cropped.png", width: 100%),
  caption: [
    Risultati Google Lighthouse della pagina "_Home_"
  ],
)
== Total Validator
Per garantire un’esperienza inclusiva e conforme agli standard internazionali, tutte le pagine del sito sono state sottoposte a test automatizzati tramite *Total Validator*. 

I controlli sono stati eseguiti seguendo le linee guida *WCAG 2.2* al livello più elevato (*AAA*), e il programma non ha rilevato errori in nessuna delle pagine.

I risultati sono stati integrati con verifiche manuali tramite screen reader *NVDA* e *VoiceOver*.

= Note sull'utilizzo
Viene fornito un'ulteriore account con username e password uguali ad _utente_, in aggiunta agli account _user_ e _admin_.\
Questo consente di provare tutte le funzionalità del sito web, come ad esempio iniziare uno scambio tra due utenti.