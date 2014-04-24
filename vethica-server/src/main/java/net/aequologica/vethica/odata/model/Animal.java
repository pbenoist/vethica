package net.aequologica.vethica.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;


@Entity(name = "animal")
public class Animal {
        @Id
        private Long id;
        
        @Column(length=15)
        private String nu_serie;
        
        @Column(length=80)
        private String nom;
        @Column(length=80)
        private String race;
}
