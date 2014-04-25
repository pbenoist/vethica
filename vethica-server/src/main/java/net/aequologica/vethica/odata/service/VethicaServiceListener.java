package net.aequologica.vethica.odata.service;

import static net.aequologica.vethica.odata.service.VethicaServiceFactory.PUNIT_NAME;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import net.aequologica.vethica.odata.model.Proprio;

@WebListener
public class VethicaServiceListener implements ServletContextListener {

    public VethicaServiceListener() {
    }

    public void contextDestroyed(ServletContextEvent arg0) {
    }

    public void contextInitialized(ServletContextEvent arg0) {
        /**
         * Load Sample Data
         **/
        // @formatter:off
             /*
             List<Car> cars1 = new ArrayList<Car>();
             List<Car> cars2 = new ArrayList<Car>();
             List<Car> cars3 = new ArrayList<Car>();
             Calendar mfDate1 = Calendar.getInstance();
             Calendar mfDate2 = Calendar.getInstance();
             Calendar mfDate3 = Calendar.getInstance();
             mfDate1.clear();
             mfDate2.clear();
             mfDate3.clear();
             mfDate1.set(2010, 1, 2, 3, 4, 5);
             mfDate2.set(2011, 2, 3, 4, 5, 6);
             mfDate3.set(2012, 3, 4, 5, 6, 7);
             Address address1 = new Address("S1", "C1", "Z1", "CN");
             Address address2 = new Address("S2", "C2", "Z2", "CN");
             Address address3 = new Address("S3", "C3", "Z3", "CN");

             Manufacturer mf1 = new Manufacturer(1, "SuperCar1", mfDate1, address1, cars1);
             Manufacturer mf2 = new Manufacturer(2, "SuperCar2", mfDate2, address2, cars2);
             Manufacturer mf3 = new Manufacturer(3, "SuperCar3", mfDate3, address3, cars3);

             Calendar bDate = Calendar.getInstance();
             bDate.set(1980, 02, 19);
             Driver driver = new Driver(1L, "Speeder", "Super", "Bolt", null, bDate);

             Key key = new Key(1, 2);
             Calendar carDate = Calendar.getInstance();
             carDate.set(2014, 02, 20);
             Car car = new Car(key, "M1", 20000.0, 2014, carDate.getTime(), mf1, driver);
             cars1.add(car);
             driver.setCar(car);

             */
        // @formatter:on
        try {
            Proprio proprio = new Proprio();
            proprio.setNom("ceci est mon nom");
            proprio.setPrenom("ceci est mon prénom");
            EntityManager em = Persistence.createEntityManagerFactory(PUNIT_NAME).createEntityManager();
            em.getTransaction().begin();
            em.persist(proprio);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
