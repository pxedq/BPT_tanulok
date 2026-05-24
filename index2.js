import express from 'express';
import cors from 'cors';
import mysql from 'mysql2/promise';

const app = express();
app.use(express.json());
app.use(cors());

const con = await mysql.createConnection({
  host: "localhost",
  port: 3306,
  database: "tanulok",
  user: "root",
  password: ""
});

async function getOsztalyok(req, res) {
    try {
        let sql = "SELECT * FROM osztalyok ORDER BY osztaly"
        const [ json ] = await con.query(sql, []);
        res.send(json);
    } catch (error) {
        res.status(500).send({ error:"Adatbázis hiba!" });
    }
}

async function getTanulokByOaz(req, res) {
    let { oaz } = req.params;
    if (oaz) {
        try {
            let sql = "SELECT * FROM tanulok WHERE oaz=? ORER BY nev";
            const [ json ] = await con.query(sql, [oaz]);
            res.send(json);
        } catch (error) {
            res.status(500).send({ error:"Adatbázis hiba!" });
        }
    } else {
        res.status(400).send({ error:"Hibás paraméter!" });
    }   
}

async function postTanulo(req, res) {
    let { nev, nem, kor, kep, oaz } = req.body;
    if (nev && nem && kor && kep && oaz) {
        try {
            let sql = "INSERT INTO tanulok SET nev=?, nem=?, kor=?, kep=?, oaz=?";
            const [ json ] = await con.query(sql, [nev, nem, kor, kep, oaz]);
            res.status(201).send({ msg:"Tanuló sikeresen felvéve." });
        } catch (error) {
            res.status(500).send({ error:"Adatbázis hiba!" });
        }
    } else {
        res.status(400).send({ error:"Hibás paraméter(ek)!" });
    }
}

async function putTanuloByTaz(req, res) {
    let { taz } = req.params;
    let { nev, nem, kor, kep, oaz } = req.body;
    if (nev && nem && kor && kep && oaz) {
        try {
            let sql = "UPDATE tanulok SET nev=?, nem=?, kor=?, kep=?, oaz=? WHERE taz=?";
            const [ json ] = await con.query(sql, [nev, nem, kor, kep, oaz, taz]);
            if (json.affectedRows != 0) {
                res.status(200).send({ msg:"Tanuló sikeresen módosítva." });
            } else {
                res.status(404).send({ msg:"Nincs ilyen azonosítójú tanuló." });
            }
        } catch (error) {
            res.status(500).send({ error:"Adatbázis hiba!" });
        }
    } else {
        res.status(400).send({ error:"Hibás paraméter(ek)!" });
    }
}

async function deleteTanuloByTaz(req, res) {
    let { taz } = req.params;
    if (taz) {
        try {
            let sql = "DELETE FROM tanulok WHERE taz=?";
            const [ json ] = await con.query(sql, [taz]);
            if (json.affectedRows != 0) {
                res.status(200).send({ msg:"Tanuló sikeresen törölve." });
            } else {
                res.status(404).send({ msg:"Nincs ilyen azonosítójú tanuló." });
            }
        } catch (error) {
            res.status(500).send({ error:"Adatbázis hiba!" });
        }
    } else {
        res.status(400).send({ error:"Hibás paraméter!" });
    }
}

app.get("/", (req, res) => res.send("<h1>Tanulók v1.0.0</h1>"));
app.get("/osztalyok", getOsztalyok);
app.get("/tanulok/:oaz", getTanulokByOaz);
app.post("/tanulok", postTanulo);
app.put("/tanulo/:taz", putTanuloByTaz);
app.deletet("/tanulo/:taz", deleteTanuloByTaz);

app.listen(88, err => {
    console.log(err ? err : "Server is listening on port #88");
});