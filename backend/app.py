from flask import Flask, jsonify, request
import mysql.connector

app = Flask(__name__)

def get_conn():
    # il MySQL nel container Docker (sezione 1)
    return mysql.connector.connect(
        host="127.0.0.1", user="root",
        password="root", database="musica")

def riga_to_dict(r):
    return {"id": r[0], "nome": r[1],
            "secondi": float(r[2]),
            "durata_min": float(r[3])}

@app.get("/api/brani")
def lista_brani():
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT id, nome, secondi, "
                "secondi / 60 AS durata_min "
                "FROM brani")
    righe = cur.fetchall()
    cur.close(); conn.close()
    brani = [riga_to_dict(r) for r in righe]
    return jsonify(brani), 200