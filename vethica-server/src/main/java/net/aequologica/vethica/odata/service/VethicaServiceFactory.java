/*******************************************************************************
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 ******************************************************************************/
package net.aequologica.vethica.odata.service;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import net.aequologica.vethica.odata.model.Proprio;

import org.apache.olingo.odata2.jpa.processor.api.ODataJPAContext;
import org.apache.olingo.odata2.jpa.processor.api.ODataJPAServiceFactory;
import org.apache.olingo.odata2.jpa.processor.api.exception.ODataJPARuntimeException;

public class VethicaServiceFactory extends ODataJPAServiceFactory {

    private static final String PUNIT_NAME = "Vethica";
    private static final int    PAGE_SIZE  = 12;

    /** Load Sample Data 
    **/
    static {
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
        Proprio proprio = new Proprio();
        proprio.setNom("ceci est mon nom");
        proprio.setPrenom("ceci est mon prénom");
        EntityManager em = Persistence.createEntityManagerFactory(PUNIT_NAME).createEntityManager();
        em.getTransaction().begin();
        em.persist(proprio);
        em.getTransaction().commit();

    }

    @Override
    public ODataJPAContext initializeODataJPAContext() throws ODataJPARuntimeException {
        ODataJPAContext oDataJPAContext = getODataJPAContext();
        oDataJPAContext.setEntityManagerFactory(Persistence.createEntityManagerFactory(PUNIT_NAME));
        oDataJPAContext.setPersistenceUnitName(PUNIT_NAME);

        oDataJPAContext.setPageSize(PAGE_SIZE);
        setDetailErrors(true);

        return oDataJPAContext;
    }
}
