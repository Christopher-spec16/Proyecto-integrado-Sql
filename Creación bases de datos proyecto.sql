CREATE DATABASE proyectoRecursosBasesDeDatos;

CREATE TABLE RolUsuario (
    rolUsuario_id INT IDENTITY PRIMARY KEY,
    valor NVARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO RolUsuario (valor) VALUES ('DOCENTE'), ('ADMIN');

CREATE TABLE EstadoUsuario (
    estadoUsuario_id INT IDENTITY PRIMARY KEY,
    valor NVARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO EstadoUsuario (valor) VALUES ('ACTIVE'), ('INACTIVE'), ('SUSPENDED');

CREATE TABLE TipoRecurso (
    tipoRecurso_id INT IDENTITY PRIMARY KEY,
    valor NVARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO TipoRecurso (valor) VALUES ('VIDEO'), ('AUDIO'), ('DOCUMENTO'), ('ENLACE'), ('IMAGEN'), ('OTRO');

CREATE TABLE EstadoRecurso (
    estadoRecurso_id INT IDENTITY PRIMARY KEY,
    valor NVARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO EstadoRecurso (valor) VALUES ('BORRADOR'), ('PUBLICADO'), ('ARCHIVADO');

CREATE TABLE TipoSolicitud (
    tipoSolicitud_id INT IDENTITY PRIMARY KEY,
    valor NVARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO TipoSolicitud (valor) VALUES ('CREAR'), ('ACTUALIZAR');

CREATE TABLE EstadoSolicitud (
    estadoSolicitud_id INT IDENTITY PRIMARY KEY,
    valor NVARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO EstadoSolicitud (valor) VALUES ('PENDIENTE'), ('APROBADA'), ('RECHAZADA');

CREATE TABLE Usuario (
    usuario_id INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,
    email NVARCHAR(50) NOT NULL UNIQUE,
    passwordHash NVARCHAR(255) NOT NULL,
    estadoUsuario_id INT NOT NULL FOREIGN KEY REFERENCES EstadoUsuario(estadoUsuario_id),
    rolUsuario_id INT NOT NULL FOREIGN KEY REFERENCES RolUsuario(rolUsuario_id),
    createdAt DATETIME2 DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Recurso (
    recurso_id INT IDENTITY PRIMARY KEY,
    titulo NVARCHAR(250) NOT NULL,
    descripcion TEXT,
    url NVARCHAR(250),
    tipoRecurso_id INT NOT NULL FOREIGN KEY REFERENCES TipoRecurso(tipoRecurso_id),
    comentario TEXT,
    estadoRecurso_id INT NOT NULL FOREIGN KEY REFERENCES EstadoRecurso(estadoRecurso_id),
    creadoPor_usuario_id INT NOT NULL FOREIGN KEY REFERENCES Usuario(usuario_id),
    aprobadoPor_usuario_id INT NULL FOREIGN KEY REFERENCES Usuario(usuario_id),
    revisadoPor_usuario_id INT NULL FOREIGN KEY REFERENCES Usuario(usuario_id),
    createdAt DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME2 DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE SolicitudRecurso (
    solicitudRecurso_id INT IDENTITY PRIMARY KEY,
    tipoSolicitud_id INT NOT NULL FOREIGN KEY REFERENCES TipoSolicitud(tipoSolicitud_id),
    estadoSolicitud_id INT NOT NULL FOREIGN KEY REFERENCES EstadoSolicitud(estadoSolicitud_id),
    payloadJson NVARCHAR(MAX),
    solicitadoPor_usuario_id INT NOT NULL FOREIGN KEY REFERENCES Usuario(usuario_id),
    recursoObjetivo_id INT NOT NULL FOREIGN KEY REFERENCES Recurso(recurso_id),
    aprobadoPor_usuario_id INT NULL FOREIGN KEY REFERENCES Usuario(usuario_id),
    reviewedAt DATETIME2 NULL,
    createdAt DATETIME2 DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE CursoClase (
    cursoClase_id INT IDENTITY PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,
    descripcion TEXT,
    orden INT NOT NULL,
    createdAt DATETIME2 DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE CursoClaseRecurso (
    cursoClase_id INT NOT NULL FOREIGN KEY REFERENCES CursoClase(cursoClase_id),
    recurso_id INT NOT NULL FOREIGN KEY REFERENCES Recurso(recurso_id),
    PRIMARY KEY (cursoClase_id, recurso_id)
);