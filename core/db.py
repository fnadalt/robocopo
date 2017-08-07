from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base

import logging
log=logging.getLogger(__name__)

script_creacion="crear_db.sql"
ruta_archivo="./data/db.dat"
_conexion_en_uso=False

engine=create_engine()
base=declarative_base()
