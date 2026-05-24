import express from "express"
import cors from "cors"
import mysql from "mysql2/promise"

export const app = express()
app.use(express.json())
app.use(cors())

let con = await mysql.createConnection({
    host: "localhost",
    port: 3306,
    database: "tanulok",
    user: "root",
    password: ""
});

async function getOsztalyok(req, res) {
    try {
        let sql = "SELECT * FROM osztalyok ORDER BY osztaly";
        let [ adat ] = await con.execute(sql, []);
        if(adat.length == 0) {
            res.status(404).send({error:"Nincs ilyen azonosítójú osztály!"});
        } else {
            res.send(adat);
        }
    } catch (error) {
        res.status(500).send({msg:"Adatbázis hiba!"});
    }
}

async function getTanulok(req, res) {
    let { oaz } = req.params;
    try {
        let sql = "SELECT * FROM tanulok WHERE oaz=? ORDER BY nev";
        let [ adat ] = await con.execute(sql, [oaz]);
        res.send(adat);
    } catch (error) {
        res.status(500).send({msg:"Adatbázis hiba!"});
    }
}

async function postTanulo(req, res) {
    let { nev, nem, kor, kep, oaz } = req.body;
    try {
        if (nev && nem && kor && kep && oaz) {
            let sql = "INSERT INTO tanulok SETE nev=?, nem=?, kor=?, kep=?, oaz=?"
            let [ adat ] = await con.execute(sql, [nev, nem, kor, kep, oaz]);
            res.status(201).send(adat);
        } else {  
            res.status(400).send({error:"Hibás paraméterek!"});
        }
    } catch (error) {
        res.status(500).send({msg:"Adatbázis hiba!"});
    }
}

async function putTanulo(req, res) {
    let {taz} = req.params;
    let { nev, nem, kor, kep, oaz } = req.body;
    try {
        if (nev && nem && kor && kep && oaz) {
            let sql = "UPDATE tanulok SET nev=?, nem=?, kor=?, kep=?, oaz=? WHERE taz=?";
            let [ adat ] = await con.execute(sql, [nev, nem, kor, kep, oaz, taz]);
            res.status(201).send(adat);
        } else {
            res.status(400).send({error:"Hibás paraméterek!"});
        }
    } catch (error) {
        res.status(500).send({msg:"Adatbázis hiba!"});
    }
}

async function deleteTanulo(req, res) {
    let {taz} = req.params;
    try {
        let sql = "DELETE FROM tanulok WHERE taz=?";
        let [ adat ] = await con.execute(sql, [taz]);
        if(adat.affectedRows == 0) {
            res.status(404).send({error:"Nem létező ID!"});
        } else {
            res.status(200).send(adat);
        }
        res.status(201).send(adat);
    } catch (error) {
        res.status(500).send({msg:"Adatbázis hiba!"});
    }
}

app.get("/", (req, res) => res.send("<h1>Tanulók v1.0.0</h1>"))
app.get("/osztalyok", getOsztalyok)
app.get("/tanulok/:oaz", getTanulok)
app.post("/tanulo", postTanulo)
app.put("/tanulo/:taz", putTanulo)
app.delete("/tanulo/:taz", deleteTanulo)

app.listen(88, err => console.log(err ? err : "Server on #88"))