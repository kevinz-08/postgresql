# PostgreSQL con Docker

# Creación del Contenedor

```bash
docker run -d --name=postgres_container -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=campus -p 5433:5432 -v pgdata:/var/lib/postgresql/data --restart=unless-stopped postgres:15
```

## Conectar al Contenedor

```bash
docker exec -it postgres_container sh
```

## Conectar con PostgreSQL bajo Consola

### Versión larga

```bash
psql --host=localhost --username=admin -d campus --password
```
### Versión corta

```bash
psql -h localhost -U admin -d campus -W
```

### Usuario por defecto
```bash
psql ... --username=postgres ...
```

<br>

# Comandos PSQL

- `\l`: Lista las bases de datos
- `\c`{db-name}: cambiar una base de datos existente
- `\d` : describe las tablas de la base de datos actual
- `\d table-name`: describe una tabla existente
- `\ds`: secuencias, que se crean con el tipo de datos "serial"
- `\di`: Listar los indices
- `\dp \z`: listado de privilegios de las tablas

```sql
CREATE TYPE sexo AS ENUM('masculino','femenino', 'otro');

CREATE TABLE camper(
    name VARCHAR(100) NOT NULL,
    sexo_camper sexo NOT NULL
);
```

```sql
CREATE TABLE ejemplo (
    id serial PRIMARY KEY,
    nombre varchar(100) NOT NULL,
    descripcion text NULL,
    precio numeric(10,2) NOT NULL,
    en_stock boolean NOT NULL,
    fecha_creacion date NOT NULL,
    hora_creacion time NOT NULL,
    fecha_hora timestamp NOT NULL,
    fecha_hora_zona timestamp with time zone,
    duracion interval,
    direccion_ip inet,
    direccion_mac macaddr,
    punto_geometrico point,
    datos_json json,
    datos_jsonb jsonb,
    identificador_unico uuid,
    cantidad_monetario money,
    rangos int4range,
    colores_preferidos varchar(20)[]
);
```

### Insert para `Ejemplo`
```sql
INSERT INTO ejemplo (
nombre, descripcion, precio, en_stock, fecha_creacion, hora_creacion, fecha_hora, fecha_hora_zona, duracion, direccion_ip , direccion_mac , punto_geometrico , datos_json , datos_jsonb , identificador_unico , cantidad_monetario , rangos, colores_preferidos)
VALUES(
    'Ejemplo A', 'Lorem ipsum......', 9990.99, true, '2025-07-10', '20:30:10', '2025-07-10 20:30:10', '2025-07-10 20:30:10-05', '1 day', '192.168.0.1', '08:00:27:00:00:00', '(10, 20)', '{"key":"value"} ', '{"key":"value"}', 'b8ac502c-7049-4ae5-aa7e-642ad77ca4f1', '100.00', '[10, 20)', ARRAY['rojo','verde','azul', 'otro']
);
```
## Definicion de Contraints (Restricciones)

### Tabla de Ejemplo
``` SQL
CREATE TABLE empleados(
    id serial,
    nombre varchar(100) NOT NULL,
    edad integer NOT NULL,
    salario numeric(10,2) NOT NULL,
    fecha_contrato date,
    vigente boolean DEFAULT true
);
```
```sql
CREATE TABLE departamentos(
    id serial,
    nombre varchar(100) NOT NULL,
    vigente boolean DEFAULT true,
    PRIMARY KEY(id)
);

ALTER TABLE empleados ADD COLUMN departamento_id integer NOT NULL;
```

## Constraints a Tablas existentes

### Primary Key

``` SQL
ALTER TABLE empleados ADD PRIMARY KEY(id);
```

### Foreign Key
```sql
ALTER TABLE empleados ADD CONSTRAINT fk_departamentos FOREIGN KEY (departamento_id) REFERENCES departamentos(id);
```

### Unique
> Agregar la restriccion de UNIQUE a `nombre`
```sql
ALTER TABLE empleados ADD CONSTRAINT uk_nombre UNIQUE(nombre);
```
### Check
> Agrega la restriccion de CHECK para validar que la `edad` del empleado sea >= 18
```sql
ALTER TABLE empleados ADD CONSTRAINT ck_edad CHECK (edad >= 18);
```
### Default
> Agregar un DEFAULT para `salario` de 400.00
```sql
ALTER TABLE empleados ALTER COLUMN salario SET DEFAULT 400.00;
```
### Not Null
> Agregar la restriccion de NOT NULL a `nombre`
```sql
ALTER TABLE empleados ALTER COLUMN nombre SET NOT NULL;
```

## Taller de Constraints
```sql
CREATE TABLE country (
    id serial,
    name varchar(50)
);
```
```sql
CREATE TABLE region (
    id serial,
    name varchar(50),
    idcountry integer
);
```
```sql
CREATE TABLE city (
    id serial,
    name varchar(50),
    idregion integer
);
```

### Solucion
```sql
ALTER TABLE country ADD PRIMARY KEY (id);

ALTER TABLE country 
```