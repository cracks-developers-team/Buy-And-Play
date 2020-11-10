CREATE DATABASE tiendavideojuegos;

USE tiendavideojuegos;

--Tabla de usuarios (Contendra tanto clientes como administradores)

CREATE TABLE usuarios(
    usu_id int (5) AUTO_INCREMENT NOT NULL,
    usu_nombre varchar (40) NOT NULL,
    usu_apellido varchar (40) NOT NULL,
    usu_fecha_nac date NOT NULL,
    usu_sexo varchar (15) NOT NULL,
    usu_domicilio varchar (200) NOT NULL,
    usu_telefono varchar (10) NOT NULL,
    usu_email varchar (100) NOT NULL,
    usu_username char (32) NOT NULL,
    usu_password char (32) NOT NULL,
    usu_tipo varchar (15) DEFAULT 'CLIENTE',
    PRIMARY KEY (usu_id)
);

--Procedimiento almacenado para llenar la tabla usuarios

delimiter //
create procedure sp_usuarios_ins
  (in usu_nombre varchar (40),
  usu_apellido varchar (40),
  usu_fecha_nac date,
  usu_sexo varchar (15),
  usu_domicilio varchar (200),
  usu_telefono varchar (10),
  usu_email varchar (100),
  usu_username char (32),
  usu_password char (32),
  usu_tipo varchar (15)
  )
  BEGIN
  insert into usuarios values
    (
      usu_id,usu_nombre,
      usu_apellido,usu_fecha_nac,
      usu_sexo,usu_domicilio,
      usu_telefono,usu_email,
      usu_username,usu_password,
      usu_tipo
    );
    END //
    delimiter ;

--Tabla tarjetas bancarias

CREATE TABLE tarjetas(
    tar_id int (5) AUTO_INCREMENT,
    tar_num char (16) NOT NULL,
    tar_titular_nom varchar (50),
    tar_titular_apellido varchar (50),
    tar_cvv char (3) NOT NULL,
    tar_fecha_exp char (5) NOT NULL,
    tar_dom varchar (100) NOT NULL,
    tar_banco varchar (20) NOT NULL,
    tar_tipo varchar (15) NOT NULL,
    tar_usu_id int (5) NOT NULL,
    PRIMARY KEY (tar_id),
    FOREIGN KEY (tar_usu_id) REFERENCES usuarios (usu_id)
);

--Procedimiento almacenado para llenar la tabla tarjetas
delimiter //
  create procedure sp_tarjetas_ins
    (in tar_num char (16),
    tar_titular_nom varchar (50),
    tar_titular_apellido varchar (50),
    tar_cvv char (3),
    tar_fecha_exp char (5),
    tar_dom varchar (100),
    tar_banco varchar (20),
    tar_tipo varchar (15),
    tar_usu_id int (5)
  )
  BEGIN
  insert into tarjetas values
    (
      tar_id,tar_num,
      tar_titular_nom,
      tar_titular_apellido,
      tar_cvv,tar_fecha_exp,
      tar_dom,tar_banco,tar_tipo,
      tar_usu_id
    );
    END //
    delimiter ;

--//Tabla consolas

CREATE TABLE consolas(
    cons_id int (5) AUTO_INCREMENT,
    cons_nombre varchar (20) NOT NULL,
    cons_desc varchar (200) NOT NULL,
    PRIMARY KEY (cons_id)
);

--Procedimiento almacenado para llenar la tabla consolas

delimiter //
create procedure sp_consolas_ins
  (
    in cons_nombre varchar (20),
    cons_desc varchar (200)
  )
  BEGIN
  insert into consolas values
    (
      cons_id,
      cons_nombre,
      cons_desc
    );
    END //
    delimiter ;

--//Tabla categorias

CREATE TABLE categorias(
    cat_id int (5) AUTO_INCREMENT,
    cat_nombre varchar (20) NOT NULL,
    PRIMARY KEY (cat_id)
);

--Procedimiento almacenado para llenar la tabla categorias

delimiter //
create procedure sp_categorias_ins
  (in cat_nombre varchar (20)  )
  BEGIN
  insert into categorias values
    (
      cat_id,cat_nombre
    );
    END //
    delimiter ;

--//Tabla de productos

CREATE TABLE productos(
    prod_id int (5) AUTO_INCREMENT,
    prod_nombre varchar (100) NOT NULL,
    prod_desarrollador varchar (100) NOT NULL,
    prod_desc varchar (200) NOT NULL,
    prod_id_categoria int (5) NULL,
    pro_cat_nom varchar (20) NULL,
    prod_year_lanzamiento int (4) NOT NULL,
    prod_id_consola int (5) NOT NULL,
    prod_portada varchar (100) NULL,
    prod_precio decimal (7,2) NOT NULL,
    prod_stock int (5) NOT NULL,
    prod_calificacion decimal (2,1) NOT NULL,
    prod_uni_vendidas int (5) NOT NULL,
    PRIMARY KEY (prod_id),
    FOREIGN KEY(prod_id_consola) REFERENCES consolas(cons_id),
    FOREIGN KEY(prod_id_categoria) REFERENCES categorias(cat_id)
);

-- Procedimiento para llenar la tabla productos
-- Se agregaron los datos prod_consola_nom y prod_cat_nom pero
-- el SP solo pide el id de ambos y los busca en las otras tablas

delimiter //

create procedure sp_productos_ins
  (
  prod_nombre varchar (100),
  prod_desarrollador varchar (100),
  prod_desc varchar (200),
  prod_id_categoria int (5),
  prod_year_lanzamiento int (4),
  prod_id_consola int (5),
  prod_portada varchar (100),	  
  prod_precio decimal (7,2),
  prod_stock int (5),
  prod_calificacion decimal (2,1),
  prod_uni_vendidas int (5)
  )
  BEGIN
  set @cat = (select cat_nombre from categorias where categorias.cat_id = prod_id_categoria);
  insert into productos values
    (
      prod_id,prod_nombre,prod_desarrollador,prod_desc,
      prod_id_categoria,@cat,
      prod_year_lanzamiento,prod_id_consola,
      prod_portada,prod_precio,prod_stock,
      prod_calificacion,prod_uni_vendidas
    );
    END //
    delimiter ;


--//Tabla lista de deseos

CREATE TABLE lista_deseos(
    list_id int (5) AUTO_INCREMENT,
    list_prod_id int (5) NOT NULL,
    list_prod_nom varchar (100) NOT NULL,
    list_usu_id int (5) NOT NULL,
    list_fecha date NOT NULL,
    PRIMARY KEY (list_id),
    FOREIGN KEY (list_prod_id) REFERENCES productos (prod_id),
    FOREIGN KEY (list_usu_id) REFERENCES usuarios (usu_id)
);

--Procedimiento almacenado para llenar la tabla lista de lista_deseos

delimiter //
  create procedure sp_lista_deseos_ins
    (in list_prod_id int (5),
    list_usu_id int (5),
    list_fecha date)
    BEGIN
    set @nom = (select prod_nombre from productos where productos.prod_id = list_prod_id);
    insert into lista_deseos values
      (
        list_id,list_prod_id,
        @nom,list_usu_id,list_fecha
      );
      END //
      delimiter ;

--//Tabla estatus

CREATE TABLE estatus(
    est_id int (5) AUTO_INCREMENT,
    est_nombre varchar (20) NOT NULL,
    PRIMARY KEY (est_id)
);

-- Procedimiento almacenado para llenar la tabla estatus

delimiter //
create procedure sp_status_ins
  (in est_nombre varchar (20))
  BEGIN
  insert into estatus values
    (
      est_id,est_nombre
    );
    END //
    delimiter ;

--//Tabla de ordenes

CREATE TABLE ordenes(
    ord_id int (5) AUTO_INCREMENT,
    ord_usu_id int (5) NOT NULL,
    ord_usu_nom varchar (100) NOT NULL,
    ord_prod_id int (5) NOT NULL,
    ord_prod_nom varchar (100) NOT NULL,
    ord_cantidad int (3) NOT NULL,
    ord_direccion_entrega varchar (200) NOT NULL,
    ord_tipo_pago varchar (30) NOT NULL,
    ord_fecha_pago date NOT NULL,
    PRIMARY KEY (ord_id),
    FOREIGN KEY (ord_usu_id) REFERENCES usuarios (usu_id),
    FOREIGN KEY (ord_prod_id) REFERENCES productos (prod_id)
);

-- Procedimiento almacenado para llenar la tabla orden_detalles
delimiter //
create procedure sp_ordenes_ins
	(
		ord_usu_id int (5),
		ord_prod_id int (5),
		ord_cantidad int (3),
		ord_tipo_pago varchar (30),
		ord_fecha_pago date
	)
	BEGIN
	set @user = (select usu_nombre from usuarios where usuarios.usu_id = ord_usu_id);
	set @prod = (select prod_nombre from productos where productos.prod_id = ord_prod_id);
	set @dom = (select usu_domicilio from usuarios where usuarios.usu_id = ord_usu_id);
	insert into ordenes values 
		(
			ord_id, ord_usu_id,@user,ord_prod_id,@prod,
			ord_cantidad,@dom,ord_tipo_pago,ord_fecha_pago
		);
		END //
		delimiter ;

--//Tabla orden_detalles

CREATE TABLE orden_detalles(
    id int (5) AUTO_INCREMENT,
    ord_id int (5) NOT NULL,
    precio_unitario decimal (7,2) NOT NULL,
    total_venta decimal (10,2) NOT NULL,
    fecha_envio date NOT NULL,
    shipper varchar (30) NOT NULL,
    est_id int (5) DEFAULT 1,
    PRIMARY KEY (id),
    FOREIGN KEY (ord_id) REFERENCES ordenes (ord_id),
    FOREIGN KEY (est_id) REFERENCES estatus (est_id)
);


-- Prueba de proyecto
