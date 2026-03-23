# 📦 App Gestione Prodotti - Java Enterprise

Benvenuto nel repository del progetto **Gestione Prodotti**. Si tratta di un'applicazione web sviluppata in **Java Enterprise Edition (Java EE)** progettata per gestire un catalogo di prodotti, supportando operazioni CRUD e l'autenticazione degli utenti. 

Il progetto applica rigorosamente i principi dell'ingegneria del software, separando la logica di business, l'accesso ai dati e l'interfaccia utente.

## 🏛️ Architettura e Pattern di Sviluppo

L'applicazione è costruita seguendo il pattern architetturale **MVC (Model-View-Controller)** e fa largo uso di design pattern standard del mondo Enterprise:

* **Logica di Business (Controller):** Gestita tramite **Java Servlet** (es. `HomeServlet`, `InserisciProdotto`, `gestioneLogin`). Le Servlet elaborano le richieste HTTP del client, eseguono le operazioni logiche necessarie e smistano le risposte alle viste corrette.
* **Data Access Object (Pattern DAO):** L'accesso al database è totalmente isolato e centralizzato nella classe `collegamentoDAO.java`. Questo pattern garantisce che la logica di business non sia strettamente accoppiata alle query SQL, facilitando la manutenzione e la sicurezza.
* **Model:** Implementato tramite semplici classi Java (POJO/JavaBeans come `Product.java`) che rappresentano le entità del dominio e vengono scambiate tra i vari livelli dell'applicazione.
* **View:** L'interfaccia utente è sviluppata utilizzando **JSP (JavaServer Pages)**, che permettono di generare pagine web dinamiche mostrando i dati elaborati dal backend.

## 🛠️ Tecnologie Utilizzate

* **Linguaggio:** Java
* **Tecnologie Web:** Java Servlets, JSP (JavaServer Pages), HTML, CSS
* **Database:** PostgreSQL
* **Connettività Database:** JDBC (Driver `postgresql-42.7.3.jar` incluso in `WEB-INF/lib`)
* **Web Server / Servlet Container:** Apache Tomcat (consigliato)

## 📂 Struttura del Progetto

Il codice sorgente è organizzato in package per separare chiaramente le responsabilità:

* **`src/main/java/applicazione/` (Model & DAO)**
    * `Product.java`: Entità che rappresenta il prodotto.
    * `collegamentoDAO.java`: Gestisce le connessioni al database PostgreSQL e contiene tutte le query SQL (Insert, Select, Delete).
* **`src/main/java/web/` (Controllers / Business Logic)**
    * Contiene le Servlet che gestiscono il flusso dell'applicazione: `gestioneLogin.java`, `InserisciProdotto.java`, `VisualizzaProdotti.java`, `EliminaProdotto.java`, `HomeServlet.java`.
* **`src/main/webapp/` (Views & Configurazione)**
    * Contiene le pagine JSP (`index.jsp`, `home.jsp`, `inserisciProdotto.jsp`, `registrati.jsp`, `errore.jsp`).
    * `WEB-INF/web.xml`: File di configurazione (Deployment Descriptor) per la mappatura delle Servlet.

## 🚀 Istruzioni per l'Avvio

### 1. Prerequisiti
* [Java Development Kit (JDK)](https://www.oracle.com/java/technologies/downloads/) installato (versione 8 o superiore).
* [Apache Tomcat](https://tomcat.apache.org/) (versione 9 o superiore) configurato nel tuo IDE (es. Eclipse Enterprise o IntelliJ IDEA Ultimate).
* Server **PostgreSQL** in esecuzione locale.

### 2. Configurazione del Database
1.  Apri pgAdmin (o il tuo client PostgreSQL preferito).
2.  Crea un database dedicato al progetto.
3.  Crea le tabelle necessarie (Utenti e Prodotti) in base ai campi richiesti in `collegamentoDAO.java`.
4.  Assicurati che le credenziali di accesso (URL, username, password) all'interno del file `collegamentoDAO.java` corrispondano a quelle del tuo database locale.

### 3. Deployment
1. Importa il progetto nel tuo IDE come "Dynamic Web Project" (Eclipse) o "Java Enterprise" (IntelliJ).
2. Aggiungi Apache Tomcat ai Server dell'IDE.
3. Assicurati che il driver JDBC di PostgreSQL sia correttamente caricato nel build path o presente nella cartella `WEB-INF/lib`.
4. Avvia il progetto sul server Tomcat.
5. Il sito sarà accessibile dal browser (generalmente all'indirizzo `http://localhost:8080/Gestione_Prodotti`).

---
*Progetto sviluppato per illustrare l'integrazione di tecnologie Java EE e la gestione strutturata dei dati tramite pattern DAO.*
