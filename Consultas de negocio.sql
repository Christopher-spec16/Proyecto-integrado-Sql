SELECT * FROM Usuario;

SELECT 
nombre
FROM Usuario
WHERE estadoUsuario_id = (SELECT estadoUsuario_id FROM EstadoUsuario WHERE valor = 'ACTIVE');

SELECT
nombre
FROM Usuario
WHERE rolUsuario_id = (SELECT rolUsuario_id FROM RolUsuario WHERE valor = 'ADMIN');

SELECT * FROM Recurso;

SELECT
titulo, url 
FROM Recurso
WHERE estadoRecurso_id = (SELECT estadoRecurso_id FROM EstadoRecurso WHERE valor = 'PUBLICADO');

SELECT
r.titulo AS Recurso, u.nombre AS Creador
FROM Recurso r
INNER JOIN Usuario u ON r.creadoPor_usuario_id = u.usuario_id
WHERE r.estadoRecurso_id = (SELECT estadoRecurso_id FROM EstadoRecurso WHERE valor = 'BORRADOR');

SELECT
r.titulo AS Recurso, u.nombre AS Creador
FROM Recurso r
INNER JOIN Usuario u ON r.creadoPor_usuario_id = u.usuario_id
WHERE r.estadoRecurso_id = (SELECT estadoRecurso_id FROM EstadoRecurso WHERE valor = 'PUBLICADO');

SELECT nombre AS Nivel
FROM CursoClase;

SELECT * FROM CursoClaseRecurso;

SELECT
c.nombre AS CursoClase, r.titulo AS Recurso
FROM CursoClaseRecurso ccr
INNER JOIN CursoClase c ON ccr.cursoClase_id = c.cursoClase_id
INNER JOIN Recurso r ON ccr.recurso_id = r.recurso_id
ORDER BY c.orden, r.createdAt;

SELECT
u.nombre AS AdministradorSenior, COUNT(r.aprobadoPor_usuario_id) AS SolicitudesAprobadas
FROM Usuario u
INNER JOIN Recurso r ON u.usuario_id = r.aprobadoPor_usuario_id
WHERE u.rolUsuario_id = (SELECT rolUsuario_id FROM RolUsuario WHERE valor = 'ADMIN')
GROUP BY u.nombre
HAVING COUNT(r.aprobadoPor_usuario_id) > 5
ORDER BY SolicitudesAprobadas DESC;

SELECT
u.nombre AS AdministradorJunior, COUNT(r.aprobadoPor_usuario_id) AS SolicitudesAprobadas
FROM Usuario u
INNER JOIN Recurso r ON u.usuario_id = r.aprobadoPor_usuario_id
WHERE u.rolUsuario_id = (SELECT rolUsuario_id FROM RolUsuario WHERE valor = 'ADMIN')
GROUP BY u.nombre
HAVING COUNT(r.aprobadoPor_usuario_id) <= 5
ORDER BY SolicitudesAprobadas DESC
;

/*==========================
 PROCEDIMIENTOS ALMACENADOS
 ==========================*/

 /* procedimiento para buscar en la tabla usuario, su nombre completo y su rol */

 CREATE PROCEDURE sp_UsuarioPorID
(
    @idUsuario INT,
    @nombreCompleto NVARCHAR(150) OUTPUT,
    @rol NVARCHAR(50) OUTPUT
)
AS
BEGIN
    SELECT 
        @nombreCompleto = nombre,
        @rol = R.valor
    FROM Usuario U
    INNER JOIN RolUsuario R ON U.rolUsuario_id = R.rolUsuario_id
    WHERE U.usuario_id = @idUsuario;
END;


/* procedimiento almacenado #2 */
/*recibe un id de usuario y devuelve la cantidad total de recursos que pertenecen a ese usuario */

CREATE PROCEDURE sp_TotalRecursosPorUsuario
(
    @idUsuario INT,
    @total INT OUTPUT
)
AS
BEGIN
    SELECT @total = COUNT(*)
    FROM Recurso
    WHERE usuario_id = @idUsuario;
END;


/* procedimiento almacenado #3 */
/* este proceso sirve para insertar nuevos recursos y devolver el id del recurso recien agregado */

CREATE PROCEDURE sp_InsertarRecurso
(
    @titulo NVARCHAR(100),
    @descripcion NVARCHAR(MAX),
    @url NVARCHAR(255),
    @tipoRecurso_id INT,
    @notasDocente NVARCHAR(MAX),
    @usuario_id INT,
    @nuevoID INT OUTPUT
)
AS
BEGIN
    INSERT INTO Recurso (titulo, descripcion, url, tipoRecurso_id, notasDocente, usuario_id)
    VALUES (@titulo, @descripcion, @url, @tipoRecurso_id, @notasDocente, @usuario_id);

    SET @nuevoID = SCOPE_IDENTITY();/* devuelve el id del recurso recien agregado o creado */
END;


/* procedimiento almacenado #4 */
/* este proceso cambia el estado de la solicitud de recurso y devuelve un mensaje de confirmacion  */

CREATE PROCEDURE sp_ActualizarEstadoSolicitud
(
    @idSolicitud INT,
    @nuevoEstado INT,
    @mensaje NVARCHAR(200) OUTPUT
)
AS
BEGIN
    UPDATE SolicitudRecurso
    SET estadoSolicitud_id = @nuevoEstado
    WHERE solicitudRecurso_id = @idSo.licitud;

    SET @mensaje = 'Estado de solicitud actualizado correctamente';
END;

/* proceso almacenado #5 */
/* este proceso almacenado sirve para contar cuantos recursos estan asociados a una clase o curso */

CREATE PROCEDURE sp_RecursosPorClase
(
    @idClase INT,
    @total INT OUTPUT
)
AS
BEGIN
    SELECT @total = COUNT(*)
    FROM CursoClaseRecurso
    WHERE cursoClase_id = @idClase;
END;

/* proceso almacenado #6 */
/* este proceso almacenado sirve para contar cuantas solicitudes pendientes existen de un tipo especifico */

CREATE PROCEDURE sp_SolicitudesPendientesPorTipo
(
    @tipoSolicitud INT,
    @totalPendientes INT OUTPUT
)
AS
BEGIN
    SELECT @totalPendientes = COUNT(*)
    FROM SolicitudRecurso
    WHERE tipoSolicitud_id = @tipoSolicitud
      AND estadoSolicitud_id = 1; -- Asumiendo que 1 = PENDIENTE
END;