package net.aequologica.vethica.odata.service;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

import org.glassfish.jersey.servlet.ServletContainer;

@WebServlet(
        name = "VethicaServiceServlet", 
        urlPatterns = { "/Vethica.svc/*" }, 
        loadOnStartup = 1,
        initParams = { 
                @WebInitParam(
                        name = "javax.ws.rs.Application", 
                        value = "org.apache.olingo.odata2.core.rest.app.ODataApplication"
                ),
                @WebInitParam(
                        name = "org.apache.olingo.odata2.service.factory", 
                        value = "net.aequologica.vethica.odata.service.VethicaServiceFactory"
                )
        }
)
public class VethicaServiceServlet extends ServletContainer {

    private static final long serialVersionUID = 5221704274334701236L;

}
