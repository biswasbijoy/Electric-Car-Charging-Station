CREATE TABLE category (
  id int(30) NOT NULL,
  name text NOT NULL,
  rate double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE category ADD PRIMARY KEY (id);
ALTER TABLE category MODIFY id int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8 ;

SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

INSERT INTO category(id, name, rate) SELECT id, name, rate FROM parking_db.category;
CREATE TABLE parked_list (
  id int(30) NOT NULL,
  category_id int(30) NOT NULL,
  location_id int(30) NOT NULL,
  ref_no varchar(100) NOT NULL,
  vehicle_brand varchar(200) NOT NULL,
  vehicle_registration varchar(15) NOT NULL,
  owner text NOT NULL,
  vehicle_description text NOT NULL,
  status tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=in, 2= out',
  amount_due double NOT NULL,
  amount_tendered double NOT NULL,
  amount_change double NOT NULL,
  date_created datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE parked_list ADD PRIMARY KEY (id);
ALTER TABLE parked_list MODIFY id int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12 ;

SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

INSERT INTO parked_list(id, category_id, location_id, ref_no, vehicle_brand, vehicle_registration, owner, vehicle_description, status, amount_due, amount_tendered, amount_change, date_created) SELECT id, category_id, location_id, ref_no, vehicle_brand, vehicle_registration, owner, vehicle_description, status, amount_due, amount_tendered, amount_change, date_created FROM parking_db.parked_list;
CREATE TABLE parking_locations (
  id int(30) NOT NULL,
  location text NOT NULL,
  capacity int(11) NOT NULL,
  category_id int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE parking_locations ADD PRIMARY KEY (id);
ALTER TABLE parking_locations MODIFY id int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5 ;

SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

INSERT INTO parking_locations(id, location, capacity, category_id) SELECT id, location, capacity, category_id FROM parking_db.parking_locations;
CREATE TABLE parking_movement (
  id int(30) NOT NULL,
  pl_id int(30) NOT NULL,
  status tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = in ,2 = out',
  created_timestamp datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE parking_movement ADD PRIMARY KEY (id);
ALTER TABLE parking_movement MODIFY id int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18 ;

SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

INSERT INTO parking_movement(id, pl_id, status, created_timestamp) SELECT id, pl_id, status, created_timestamp FROM parking_db.parking_movement;
CREATE TABLE users (
  id int(30) NOT NULL,
  name text NOT NULL,
  type tinyint(4) NOT NULL DEFAULT 2 COMMENT '1 = Admin, 2= staff',
  username varchar(100) NOT NULL,
  password text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
ALTER TABLE users ADD PRIMARY KEY (id);
ALTER TABLE users MODIFY id int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6 ;

SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

INSERT INTO users(id, name, type, username, password) SELECT id, name, type, username, password FROM parking_db.users;