## Utente
- **email**
- password (hash)
- nome
- cognome
- citta

## Libri
- **isbn**
- titolo
- autore
- editore
- anno
- genere
- lingua

## Copia
- **ID**
- _ISBN_
- condizioni
<!-- derivato: disponibile -->

## Desiderati
- _email_
- _ISBN_

## Posseduti
- _email_
- _IdCopia_

## Scambio
- **_emailProponente_** <!-- proponente dello scambio -->
- **_emailAccettatore_** <!-- proponente dello scambio -->
- **_IdCopia1_**
- **_IdCopia2_**
- **dataProposta**
- dataConclusione
<!-- - stato  Enum: proposto, accettato, in attesa, concluso -->

## Recensioni
- ***Scambio***
- testo
- valutazione <!-- float, stelline solo grafiche, bypassate da screen reader -->

## Follow:
- ***Follower***
- ***Followed***