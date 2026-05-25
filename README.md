# Proyecto Base de Datos

## Descripción técnica de la BD

El proyecto fue desarrollado utilizando SQL Server como motor de base de datos.

La base de datos administra recursos educativos, usuarios, cursos y solicitudes relacionadas con el sistema académico.

El sistema cuenta con tablas para:

- Usuarios
- Recursos
- Cursos
- Solicitudes
- Estados
- Tipos de recursos

---

# Diccionario de datos básico

## Tabla Usuario

| Campo | Tipo | Descripción |
|---|---|---|
| usuario_id | INT | Identificador del usuario |
| nombre | NVARCHAR(50) | Nombre del usuario |
| email | NVARCHAR(50) | Correo electrónico |
| rolUsuario_id | INT | Rol del usuario |

---

## Tabla Recurso

| Campo | Tipo | Descripción |
|---|---|---|
| recurso_id | INT | Identificador del recurso |
| titulo | NVARCHAR(250) | Nombre del recurso |
| descripcion | TEXT | Información del recurso |
| url | NVARCHAR(250) | Enlace del recurso |

---

# Explicación de relación entre módulos

## Relación Backend - Base de Datos

Las clases del backend se relacionan directamente con las tablas de la base de datos.

Ejemplo:

- La clase Usuario se relaciona con la tabla Usuario.
- La clase Recurso se relaciona con la tabla Recurso.
- La clase CursoClase se relaciona con la tabla CursoClase.

El backend realiza consultas SQL para insertar, actualizar y consultar información.

---

## Relación Frontend - Base de Datos

El frontend consume la información almacenada en la base de datos mediante el backend.

Ejemplos:

- El login consulta usuarios registrados.
- La vista de recursos muestra recursos almacenados.
- Los cursos obtienen información desde la base de datos.

---

# Flujo del sistema

1. El usuario interactúa con el frontend.
2. El frontend envía solicitudes al backend.
3. El backend consulta la base de datos.
4. La base de datos devuelve la información.
5. El frontend muestra los resultados al usuario.