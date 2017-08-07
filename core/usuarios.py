from sqlalchemy import Column, Integer, String
import db

import logging
log=logging.getLogger(__name__)

class Usuario(db.base):
    __tablename__="usuarios"
    
    id=Column(Integer,  primary_key=True)
    apellidos=Column(String)
    nombres=Column(String)
    dni=Column(String)
    login=Column(String)
    contrasena=Column(String)
    privilegios=Column(Integer)
    
