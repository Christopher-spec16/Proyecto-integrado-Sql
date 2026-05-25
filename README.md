# Proyecto Base de Datos

## Descripción del proyecto

Este proyecto consiste en el desarrollo de una base de datos para la gestión de recursos educativos de inglés. El sistema permite administrar usuarios, cursos, recursos multimedia y solicitudes relacionadas con el contenido académico.

La base de datos fue desarrollada utilizando Microsoft SQL Server y está diseñada para almacenar información de manera organizada mediante tablas relacionadas entre sí por llaves primarias y foráneas.

El sistema permite registrar usuarios, administrar recursos educativos, organizar cursos y controlar solicitudes de creación o actualización de contenido.

---

# Descripción técnica de la BD

Motor de base de datos utilizado:
- Microsoft SQL Server

Cantidad de tablas principales:
- RolUsuario
- EstadoUsuario
- TipoRecurso
- EstadoRecurso
- TipoSolicitud
- EstadoSolicitud
- Usuario
- Recurso
- CursoClase
- CursoClaseRecurso
- SolicitudRecurso

La base de datos utiliza:
- Primary Keys
- Foreign Keys
- Relaciones uno a muchos
- Relaciones muchos a muchos
- Procedimientos almacenados
- Consultas SQL
- ALTER TABLE
- UPDATE

---

# Objetivo del sistema

El objetivo principal del sistema es permitir la administración de recursos educativos de inglés para docentes y administradores.

El sistema permite:
- Registrar usuarios.
- Gestionar recursos educativos.
- Organizar cursos.
- Relacionar recursos con cursos.
- Administrar solicitudes.
- Controlar estados y tipos de recursos.

---

# Diccionario de datos básico

## Tabla Usuario

| Campo | Tipo | Descripción |
|---|---|---|
| usuario_id | INT | Identificador único del usuario |
| nombre | NVARCHAR(50) | Nombre completo del usuario |
| email | NVARCHAR(50) | Correo electrónico |
| passwordHash | NVARCHAR(255) | Contraseña cifrada |
| estadoUsuario_id | INT | Estado actual del usuario |
| rolUsuario_id | INT | Rol asignado al usuario |
| telefono | NVARCHAR(20) | Número telefónico del usuario |

### Función de la tabla
La tabla Usuario almacena toda la información de las personas registradas en el sistema, incluyendo docentes y administradores.

---

## Tabla Recurso

| Campo | Tipo | Descripción |
|---|---|---|
| recurso_id | INT | Identificador del recurso |
| titulo | NVARCHAR(250) | Nombre del recurso |
| descripcion | TEXT | Descripción del recurso |
| url | NVARCHAR(250) | Enlace del recurso |
| tipoRecurso_id | INT | Tipo del recurso |
| comentario | TEXT | Observación administrativa |
| estadoRecurso_id | INT | Estado del recurso |
| creadoPor_usuario_id | INT | Usuario creador |
| aprobadoPor_usuario_id | INT | Usuario aprobador |
| revisadoPor_usuario_id | INT | Usuario revisor |
| visitas | INT | Número de visitas |

### Función de la tabla
La tabla Recurso almacena videos, audios, documentos, imágenes y enlaces educativos utilizados dentro del sistema.

---

## Tabla CursoClase

| Campo | Tipo | Descripción |
|---|---|---|
| cursoClase_id | INT | Identificador del curso |
| nombre | NVARCHAR(50) | Nombre del curso |
| descripcion | TEXT | Descripción del curso |
| orden | INT | Nivel u orden del curso |

### Función de la tabla
La tabla CursoClase almacena los cursos o niveles académicos del sistema.

---

## Tabla CursoClaseRecurso

| Campo | Tipo | Descripción |
|---|---|---|
| cursoClase_id | INT | Curso relacionado |
| recurso_id | INT | Recurso relacionado |

### Función de la tabla
Esta tabla relaciona cursos con recursos educativos.

Permite que un curso tenga múltiples recursos y que un recurso pueda utilizarse en diferentes cursos.

---

## Tabla SolicitudRecurso

| Campo | Tipo | Descripción |
|---|---|---|
| solicitudRecurso_id | INT | Identificador solicitud |
| tipoSolicitud_id | INT | Tipo de solicitud |
| estadoSolicitud_id | INT | Estado solicitud |
| payloadJson | NVARCHAR(MAX) | Datos de la solicitud |
| solicitadoPor_usuario_id | INT | Usuario solicitante |
| recursoObjetivo_id | INT | Recurso relacionado |

### Función de la tabla
La tabla SolicitudRecurso almacena las solicitudes realizadas por los usuarios para crear o actualizar recursos educativos.

---

# Explicación de relación entre módulos

## Relación entre Backend y Base de Datos

El backend se conecta directamente con SQL Server para realizar consultas, inserciones, actualizaciones y eliminación de datos.

Las clases del backend se relacionan directamente con las tablas de la base de datos.

Ejemplos:
- La clase Usuario se conecta con la tabla Usuario.
- La clase Recurso se conecta con la tabla Recurso.
- La clase CursoClase se conecta con la tabla CursoClase.

El backend se encarga de:
- Validar información.
- Ejecutar consultas SQL.
- Procesar datos.
- Enviar respuestas al frontend.

---

## Relación entre Frontend y Base de Datos

El frontend permite a los usuarios interactuar con el sistema mediante formularios, vistas y paneles.

El frontend no se conecta directamente con SQL Server.

La comunicación funciona así:
1. El usuario interactúa con el frontend.
2. El frontend envía solicitudes al backend.
3. El backend consulta la base de datos.
4. SQL Server devuelve la información.
5. El backend procesa la respuesta.
6. El frontend muestra los datos.

Ejemplos:
- El login consulta la tabla Usuario.
- Los recursos consultan la tabla Recurso.
- Los cursos consultan CursoClase.
- Las solicitudes consultan SolicitudRecurso.

---

# Procedimientos almacenados

El sistema incluye procedimientos almacenados para automatizar procesos dentro de la base de datos.

Ejemplos:
- Contar recursos creados por usuarios.
- Insertar solicitudes automáticamente.
- Cambiar estados de usuarios.
- Aumentar visitas de recursos.
- Consultar recursos publicados.
- Consultar cursos.

Los procedimientos almacenados ayudan a:
- Mejorar organización.
- Reutilizar código SQL.
- Automatizar tareas.
- Mejorar rendimiento.

---

# Flujo general del sistema

1. El usuario ingresa al sistema desde el frontend.
2. El frontend envía información al backend.
3. El backend valida la información.
4. El backend ejecuta consultas SQL.
5. SQL Server procesa la información.
6. La base de datos devuelve resultados.
7. El backend envía respuestas al frontend.
8. El frontend muestra la información al usuario.

---

# Conclusión

La base de datos permite administrar usuarios, cursos, recursos educativos y solicitudes de manera organizada y eficiente.

El proyecto integra correctamente frontend, backend y base de datos mediante relaciones y consultas SQL que permiten el funcionamiento completo del sistema académico.