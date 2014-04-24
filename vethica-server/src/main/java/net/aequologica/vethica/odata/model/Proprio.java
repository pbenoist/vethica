package net.aequologica.vethica.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/*
 
--
create table proprio(
id_proprio int NOT NULL AUTO_INCREMENT,
nom char(80),
prenom char(80),
PRIMARY KEY (id_proprio)
);
--
create table animal(
id_animal int NOT NULL AUTO_INCREMENT,
nu_serie char(15),
nom char(80),
race char(80),
PRIMARY KEY (id_animal)
);
--
create table veto (
id_veto int NOT NULL AUTO_INCREMENT,
nu_ordre char(10),
nom char(80),
PRIMARY KEY (id_veto)
);
--
create table proprio_animal(
id_proprio_animal int NOT NULL AUTO_INCREMENT,
id_animal int,
id_proprio int,
date_achat date,
PRIMARY KEY (id_proprio_animal)
);
--
create table acte(
id_acte int NOT NULL AUTO_INCREMENT,
nom_acte char(80),
PRIMARY KEY (id_acte)
);
create table soins (
id_soins int NOT NULL AUTO_INCREMENT,
id_animal int,
id_veto int,
id_acte int,
date_soin date,
PRIMARY KEY (id_soins)
);
 
 
----- Original Message ----- 
From: Thiebaud, Christophe 
To: Philippe Benoist (pbenoist@emergensoft.fr) 
Sent: Thursday, April 24, 2014 10:15 AM
Subject: salut, un petit call ?
 */

@Entity(name = "proprio")
public class Proprio {
        @Id
        @GeneratedValue(strategy=GenerationType.IDENTITY)
        private Long id;
        
        @Column(length=80)
        private String nom;
        @Column(length=80)
        private String prenom;

        public Long getId() {
            return id;
        }
        public void setId(Long id) {
            this.id = id;
        }
        public String getNom() {
            return nom;
        }
        public void setNom(String nom) {
            this.nom = nom;
        }
        public String getPrenom() {
            return prenom;
        }
        public void setPrenom(String prenom) {
            this.prenom = prenom;
        }
}
