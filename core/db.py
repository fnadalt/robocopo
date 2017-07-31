import sqlite3
import os, os.path

import logging
log=logging.getLogger(__name__)

script_creacion="crear_db.sql"
ruta_archivo="./data/db.dat"

def verificar():
    if not os.path.exists(ruta_archivo):
        return False
    return True

def crear():
    if verificar():
        return True
    log.info("creando la base de datos por primera vez")
    #
    archivo=None
    script=""
    try:
        log.info("leyendo script de creacion")
        archivo=open(script_creacion,  "r") 
        script=archivo.readall()
    except Exception as e:
        log.exception(str(e))
    finally:
        if not archivo==None:
            archivo.close()
    if script=="":
        return False
    #
    try:
        log.info("ejecutando script")
        conn=sqlite3.connect(ruta_archivo)
        conn.executescript(script)
        conn.commit()
    except Exception as e:
        log.exception(str(e))
        script=""
    finally:
        conn.close()
    if script=="":
        if os.path.exists(ruta_archivo):
            os.remove(ruta_archivo)
        return False
    #
    log.info("base de datos creada")
    return True
