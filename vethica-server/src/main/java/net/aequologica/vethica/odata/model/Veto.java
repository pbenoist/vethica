package net.aequologica.vethica.odata.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "veto")

public class Veto {
        @Id
        @GeneratedValue(strategy=GenerationType.IDENTITY)
        private Long id;
        
        @Column(length=80)
        private String nom;
        @Column(length=10, name="nu_ordre")
        private String nuOrdre;
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
        public String getNuOrdre() {
            return nuOrdre;
        }
        public void setNuOrdre(String nuOrdre) {
            this.nuOrdre = nuOrdre;
        }
        
        
}
