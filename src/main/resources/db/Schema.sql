DROP TABLE IF EXISTS company;
CREATE TABLE company (
  company_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  company_name VARCHAR(255) NOT NULL,
  owner_id BIGINT(20) NOT NULL,
  created_time DATETIME NOT NULL,
  public_id VARCHAR(255) NOT NULL,
  
  PRIMARY KEY (company_id)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS company_user;
CREATE TABLE company_user (
  user_id BIGINT(20) NOT NULL AUTO_INCREMENT,
  company_id BIGINT(20) NOT NULL,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  blocked BOOLEAN NOT NULL,
  
  PRIMARY KEY (user_id),
  UNIQUE KEY (email, company_id),
  FOREIGN KEY (company_id) REFERENCES company(company_id)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;

ALTER TABLE company ADD CONSTRAINT fk_owner_user_id FOREIGN KEY (owner_id) REFERENCES company_user(user_id);