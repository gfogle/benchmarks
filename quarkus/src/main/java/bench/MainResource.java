package com.bench.qbench;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.eclipse.microprofile.config.inject.ConfigProperty;

@Path("/h")
public class MainResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String index() {
      return "Hello from Quarkus!";
    }
}
