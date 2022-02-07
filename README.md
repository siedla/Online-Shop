# Projekt Bazy Danych
## Skład:
### Jakub Libera
### Michał Siedlanowski
### Robert Kubok
## Projekt - Sklep Internetowy
Projekt dotyczy utworzenia bazy danych i aplikacji dla firmy zajmującej się sprzedażą sprzętu
RTV/AGD.
Aplikacja umożliwia klientowi utworzenie konta w systemie, przeglądanie produktów, zakup
produktów, tworzenie koszyków, przeglądanie historii zakupów.
Dodatkowo aplikacja umożliwia pracownikom sklepu edytowanie informacji o produkcie, zmianę
statusu jego dostępności, zmianę aktualnej ceny.
## Baza Danych – PostgreSQL
## Aplikacja – Angular


## Baza
konfiguracja połączeniowa z bazą postawioną na **tai.db.elephantsql.com** znajduje się w pliku BD/database-service/src/index.ts.  

## Instalacja
**npm install** na ścieżce BD/database-service pobierze nam server dependencies  
startujemy server komendą  **npm run server** on BD/database-service  

Sprawdź czy posiadasz Angular CLI zainstalowanego globalnie.  
**npm install** na ścieżce BD/online-shop pobierze nam front dependencies  
Startujemy applikację **ng serve** na ścieżce BD/online-shop.  
Nawigujemy do http://localhost:4200/.  
