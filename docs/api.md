# Backend y diseño del CRUD

## 1. Elección del backend

| Opción | Lenguaje | A favor | En contra |
| :--- | :--- | :--- | :--- |
| Spring Boot | Java | Lo conocemos de Programación y facilita estructurar entidades y reglas de negocio | Más configuración inicial |
| Node.js + Express | JavaScript | Mismo lenguaje que el frontend | Hay que montar más piezas a mano |
| Laravel | PHP | Trae casi todo hecho | Lenguaje nuevo para el equipo |

**Decisión:** Elegimos **Spring Boot** (cambiando respecto a Node.js de la primera entrega) porque ya dominamos Java, lo que nos permite organizar mejor las capas del proyecto y evitar errores al programar las reglas del juego.

## 2. Diseño del CRUD

### Usuarios
| Método | Ruta | Qué hace | Recibe / Devuelve | HU / RN |
| :--- | :--- | :--- | :--- | :--- |
| POST | /api/auth/registro | Crea una cuenta nueva | Recibe: nombre, email, password. Devuelve: 201 o 400 | HU-01, RN-01 |
| POST | /api/auth/login | Inicia sesión | Recibe: email, password. Devuelve: 200 o 401 | HU-02, RN-01 |
| POST | /api/auth/logout | Cierra la sesión | Devuelve: 200 o 401 | HU-03 |
| PUT | /api/usuarios/me | Edita los datos del perfil | Recibe: campos a cambiar. Devuelve: 200 o 400 | HU-15 |

### Personajes
| Método | Ruta | Qué hace | Recibe / Devuelve | HU / RN |
| :--- | :--- | :--- | :--- | :--- |
| GET | /api/personajes | Lista todos los personajes | Devuelve: 200 + lista | HU-04, RN-05 |
| GET | /api/personajes/:id | Muestra un personaje | Devuelve: 200 o 404 | HU-05, RN-05 |

### Equipos Fantasy
| Método | Ruta | Qué hace | Recibe / Devuelve | HU / RN |
| :--- | :--- | :--- | :--- | :--- |
| POST | /api/equipos | Crea un equipo Fantasy | Recibe: nombre, id_liga, jugadores, entrenador. Devuelve: 201 o 400 | HU-06, RN-01, RN-04, RN-05 |
| GET | /api/equipos/:id | Consulta un equipo y su plantilla | Devuelve: 200, 403 o 404 | HU-07, RN-04 |
| PUT | /api/equipos/:id/alineacion | Guarda los titulares de la jornada | Recibe: jornada, alineacion. Devuelve: 200 o 400 | HU-06, HU-07, RN-04 |

### Ligas y partidos
| Método | Ruta | Qué hace | Recibe / Devuelve | HU / RN |
| :--- | :--- | :--- | :--- | :--- |
| GET | /api/ligas | Lista las ligas del usuario | Devuelve: 200 + lista | HU-10, RN-03 |
| POST | /api/ligas | Crea una liga privada | Recibe: nombre. Devuelve: 201 o 400 | HU-08, RN-01, RN-02 |
| POST | /api/ligas/:id/invitar | Une o invita a un usuario a la liga | Recibe: email o cod_invitacion. Devuelve: 200 o 404 | HU-09, RN-02, RN-03 |
| GET | /api/ligas/:id/clasificacion | Muestra la tabla de puntos | Devuelve: 200, 403 o 404 | HU-13, RN-03, RN-08 |
| GET | /api/ligas/:id/partidos | Lista los partidos jugados | Devuelve: 200, 403 o 404 | HU-14, RN-03, RN-07 |
| POST | /api/ligas/:id/partidos/simular | Simula un partido y reparte puntos | Recibe: equipos, jornada. Devuelve: 201 o 400 | HU-11, HU-12, RN-06, RN-07, RN-08 |

## 3. Ejemplo JSON de POST /api/equipos

```json
// Petición
{
  "nombre": "Karasuno Team",
  "id_liga": 3,
  "id_entrenador": 12,
  "jugadores": [1, 2, 4, 5, 7, 8]
}

// Respuesta (201)
{
  "ok": true,
  "id_equipo": 15,
  "nombre": "Karasuno Team",
  "presupuesto_restante": 15.5,
  "puntos": 0
}