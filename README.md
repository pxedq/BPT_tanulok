# Tanulok - Backend
```
 0. Indítsuk el az XAMPP programot és importáljuk a tanulok.sql fájlt!
    Ez létrehozza a tanulok adatbázist, két táblával:
    - osztalyok (oaz, osztaly, ofonev, ofokep)
    - tanulok (taz, nev, nem, kor, kep, oaz).
 1. Hozzunk létre a 88-as porton egy express alkalmazást,
    amely képes felismerni a következő kéréseket:
    * GET "/" -> adja vissza a "<h1>Tanulók v1.0.0</h1>" szöveget!
    * GET "/osztalyok" -> adja vissza osztálynévre ABC-ben
      az osztályok minden adatát!
    * GET "/tanulok/:oaz" -> adja vissza tanulónévre ABC sorrendben
      az adott osztályba járó tanulók adatait!
    * POST "/tanulok" -> ellenőrizze, hogy megkapott-e minden szükséges
      adatot (nev, nem, kor, kep, oaz), vegye fel az adatbázisba az új tanulót,
      majd 201 statuskóddal adja vissza a mysql szerver üzenetét!
    * PUT "/tanulo/:taz" -> ellenőrizze, hogy megkapott-e minden szükséges
      adatot (nev, nem, kor, kep, oaz), módosítsa adatbázisban a megfelelő
      (taz) tanulót, majd adja vissza a mysql szerver üzenetét!
    * DELETE "/tanulo/:taz" -> ellenőrizze, hogy kapott-e azonosítót,
      törölje a hozzá tartozó tanulót,
      majd adja vissza a mysql szerver üzenetét!
    Hiba esetén (status) + error adattagban jelezze a hibát:
    (400)+"Hibás paraméter!", (404)+"Nincs ilyen!", (500)+error!
 2. Ellenőrizzük az elkészült API szolgáltatásait!
```
