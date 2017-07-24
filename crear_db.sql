CREATE TABLE IF NOT EXISTS datos_filiatorios
    (
    _id_datos_filiatorios INTEGER PRIMARY KEY,
    apellidos VARCHAR(32) NOT NULL,
    nombres VARCHAR(32) NOT NULL,
    dni VARCHAR(8), /* formato: 12345678 */
    fecha_nac VARCHAR(8), /* formato: AAAAMMDD */
    );
CREATE INDEX IF NOT EXISTS idxDatosFiliatoriosApellidos ON datos_filiatorios(apellidos);
CREATE INDEX IF NOT EXISTS idxDatosFiliatoriosDni ON datos_filiatorios(dni);

CREATE TABLE IF NOT EXISTS usuarios
    (
    _id_usuario INTEGER PRIMARY KEY,
    _id_datos_filiatorios INTEGER NOT NULL ,
    login VARCHAR(16) NOT NULL,
    contrasena VARCHAR(64) NOT NULL,
    privilegios INTEGER NOT NULL DEFAULT 2 /* 0=administrador, 1=secretario, 2=alumno */
    );
CREATE INDEX IF NOT EXISTS idxUsuarioLogin ON usuarios (login);

CREATE TABLE IF NOT EXISTS alumnos
    (
    _id_alumno INTEGER PRIMARY KEY,
    _id_datos_filiatorios INTEGER NOT NULL,
    n_legajo VARCHAR(8), /* formato: ? */
    curso VARCHAR(8) NOT NULL, /* formato: ? */
    turno INTEGER NOT NULL DEFAULT 0, /* formato: 0=mañana, 1=tarde */
    modalidad INTEGER NOT NULL DEFAULT 0 /* formato: 0=presencial, 1=semi */
    );

CREATE TABLE IF NOT EXISTS materias
    (
    _id_materia INTEGER PRIMARY KEY,
    nombre VARCHAR(64) NOT NULL
    );

CREATE TABLE IF NOT EXISTS ciclos
    (
    _id_ciclo INTEGER PRIMARY KEY,
    titulo VARCHAR(64) NOT NULL
    );

CREATE TABLE IF NOT EXISTS materias_ciclos
    (
    _id_materia_ciclo INTEGER PRIMARY KEY,
    _id_ciclo INTEGER NOT NULL,
    _id_materia INTEGER NOT NULL
    );
CREATE INDEX IF NOT EXISTS idxMateriaCicloCiclo ON materias_ciclo (_id_ciclo);

CREATE TABLE IF NOT EXISTS calificaciones
    (
    _id_calificacion INTEGER PRIMARY KEY,
    _id_alumno INTEGER NOT NULL,
    _id_cliclo INTEGER NOT NULL,
    periodo_lectivo INTEGER NOT NULL, /* año */
    cuatrimestre INTEGER NOT NULL, /* 1=primero, 2=segundo */
    anotaciones VARCHAR(256) DEFAULT ""
    );
CREATE INDEX IF NOT EXISTS idxCalifAlumno ON calificaciones (_id_alumno);
CREATE INDEX IF NOT EXISTS idxCalifPerLect ON calificaciones (periodo_lectivo);

CREATE TABLE IF NOT EXISTS puntajes
    (
    _id_puntaje INTEGER PRIMARY KEY,
    _id_calificacion INTEGER NOT NULL,
    _id_materia INTEGER NOT NULL,
    nota INTEGER NOT NULL
    );
CREATE INDEX IF NOT EXISTS idxPuntajesCalif ON puntajes (_id_calificacion);
