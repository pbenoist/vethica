package net.aequologica.vethica.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity(name = "animal")
public class Animal {
        @Id
        @GeneratedValue(strategy=GenerationType.IDENTITY)
        private Long id;
        
        @Column(length=15, name="nu_serie")
        private String nuSerie;
        
        @Column(length=80)
        private String nom;
        @Column(length=80)
        private String race;
        
        public Long getId() {
            return id;
        }
        public void setId(Long id) {
            this.id = id;
        }
        public String getNuSerie() {
            return nuSerie;
        }
        public void setNuSerie(String nuSerie) {
            this.nuSerie = nuSerie;
        }
        public String getNom() {
            return nom;
        }
        public void setNom(String nom) {
            this.nom = nom;
        }
        public String getRace() {
            return race;
        }
        public void setRace(String race) {
            this.race = race;
        }
        
        
}
