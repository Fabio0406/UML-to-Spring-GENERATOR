# UML to Spring Generator — Pizarra colaborativa de diagramas de clases UML

Editor web de **diagramas de clases UML** en tiempo real. Varios usuarios pueden trabajar sobre la misma pizarra a la vez (Socket.IO) y, a partir del diagrama, el sistema **genera código Java para Spring Boot** (Entity, DTO, Repository, Service y Controller) y permite **exportar a XMI**.

> Proyecto académico — Ingeniería de Software I, UAGRM (2024).

## Funcionalidades

- Registro e inicio de sesión de usuarios.
- Creación de proyectos; cada proyecto tiene un enlace / código para compartir la pizarra.
- **Edición colaborativa en tiempo real**: los cambios se transmiten a todos los usuarios conectados a la misma pizarra.
- Clases UML con atributos y métodos, y relaciones (asociación, herencia, etc.).
- **Generación de código Java** por clase: `Entity`, `DTO`, `Repository`, `Service` y `Controller`.
- Descarga de un proyecto base de Spring Boot (`public/demo.zip`) con JSZip.
- **Exportación a XMI** para abrir el diagrama en otras herramientas UML (por ejemplo, Enterprise Architect).
- El diagrama se guarda en la base de datos como JSON.

## Tecnologías

- Node.js + Express, EJS
- Socket.IO
- MySQL (`mysql2`)
- express-session, bcryptjs
- JSZip

## Estructura

```
app.js                  # Servidor Express + Socket.IO
database/db.js          # Conexión a MySQL
routes/rutas.js         # Rutas HTTP
model/MProyecto.js      # Acceso a datos de proyectos
views/                  # login, index, create, proyecto, pizarra (EJS)
public/js/
├── main.js             # Lógica de la pizarra y descargas
├── UMLClass.js         # Clase UML + generación de código y XMI
└── UMLRelationship.js  # Relaciones UML
public/demo.zip         # Proyecto base Spring Boot
table.sql               # Script de la base de datos
```

## Requisitos

- Node.js 18 o superior
- MySQL 8 o superior

## Instalación

1. Crear la base de datos en MySQL. El script crea la base `sw` con sus tablas y se puede volver a ejecutar (borra los datos):

   ```bash
   mysql -u root -p < table.sql
   ```
2. Copiar el archivo de ejemplo y completar los valores. La app lee el archivo desde la carpeta `env/`:

   ```bash
   cp env/.env.example env/.env
   ```

   | Variable | Descripción |
   |---|---|
   | `PORT` | Puerto del servidor (por defecto `3000`) |
   | `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASS`, `DB_DATABASE` | Conexión a MySQL |
   | `SESSION_SECRET` | Texto largo y aleatorio para firmar las sesiones |

   El archivo `env/.env` está en `.gitignore`. **No lo subas al repositorio.**

3. Instalar y ejecutar:

   ```bash
   npm install
   node app.js
   ```

4. Abrir `http://localhost:3000`.
