----------
# spid-ios
SPID authentication library for iOS
# Configurazione dell'applicazione

Per la gestione delle dipendenze è stato utilizzato Carthage.
Per il download delle dipendenze usare il comando da bash:

`> carthage update`

Per la generazione degli enum corrispondenti alle immagine, stringhe localizzate è stato utilizzato Swiftgen (https://github.com/SwiftGen/SwiftGen). Per la generazione delle classi Swift è stato creato uno script sh:

    > ./GenerateResources.sh

# Funzionamento dell'app
Tutti i file della libreria sono contenuti nella directory SPIDSDK.
Per la gestione del pulsante e sua configurazione è necessario utilizzare la classe UISPIDButton:

![Configurazione Interface builder](https://image.ibb.co/dsgLiw/UISPIDButton.png)

# Servizi REST
L'app richiama due servizi REST:

- Servizio per ottenere l'elenco degli identity provider
- Servizio per ottenere l'url di login (verso cui eseguire il post dei dati) dell'identity provider passando in input l'identityId

I servizi sono mocked e sono pubblicati su mock.io (inizialmente si richiamavano i servizi REST implementati dal TEAM: https://github.com/Gianluke/spid-spring).

Workflow applicazione:

1) Tap sul pulsante "Entra in SPID"
2) Si richiama il servizio per ottenere gli identity provider
3) Tap su un identity provider
4) Si richiama il servizio REST per ottenere l'url dell'identità provider
5) Si carica l'url nella UIWebView
6) L'utente esegue la login con SPID (ora è configurato solo POSTE ID)
7) Se le credenziali sono corrette appare il messaggio di successo e viene chiusa la UIWebView

#Screenshot

![Pulsante SPID](https://github.com/mapo80/spid-ios-sdk-screenshot/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%206%20-%202017-10-08%20at%2002.13.24.png?raw=true)

![Elenco degli Identity Providers](https://github.com/mapo80/spid-ios-sdk-screenshot/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%206%20-%202017-10-08%20at%2002.13.26.png?raw=true)

![Webview con la pagina di login di PosteID](https://github.com/mapo80/spid-ios-sdk-screenshot/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%206%20-%202017-10-08%20at%2002.13.32.png?raw=true)

![Login eseguita con successo](https://github.com/mapo80/spid-ios-sdk-screenshot/blob/master/Simulator%20Screen%20Shot%20-%20iPhone%206%20-%202017-10-08%20at%2002.14.07.png?raw=true)

# To do

1) Integrazione con i servizi reali
2) Chiamata POST verso l'url dell'identity provider
3) Parsing della risposta (20X o 50X) ottenuta dopo aver eseguito la login
