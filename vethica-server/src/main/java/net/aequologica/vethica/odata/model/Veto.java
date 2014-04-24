package net.aequologica.vethica.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "veto")

public class Veto {
        @Id
        private Long id;
        
        @Column(length=80)
        private String nom;
        @Column(length=10)
        private String nu_ordre;
}
