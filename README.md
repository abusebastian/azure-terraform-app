# react-and-spring-data-rest

The application has a react frontend and a Spring Boot Rest API, packaged as a single module Maven application.

You can build the application running (`./mvnw clean verify`), that will generate a Spring Boot flat JAR in the target folder.

To start the application you can just run (`java -jar target/react-and-spring-data-rest-*.jar`), then you can call the API by using the following curl (shown with its output):

---

\$ curl -v -u greg:turnquist localhost:8080/api/employees/1
{
"firstName" : "Frodo",
"lastName" : "Baggins",
"description" : "ring bearer",
"manager" : {
"name" : "greg",
"roles" : [ "ROLE_MANAGER" ]
},
"\_links" : {
"self" : {
"href" : "http://localhost:8080/api/employees/1"
}
}
}

---

To see the frontend, navigate to http://localhost:8080. You are immediately redirected to a login form. Log in as `greg/turnquist`


---


How to configure the pipeline to deploy the App

    Create a Service connection Manually
    
    1) Go to Entra ID
    2) Click on App registrations
    3) Add a new registration
    4) Go to Certificates and Secrets
    5) Add new client secret
    6) Go to the subscription and click on IAM
    7) Add a role assignments and give "Owner" permission to the App registation which you created in step 3 (Allow user to assign all roles except privileged administrator roles Owner, UAA, RBAC (Recommended) 
        Allow user to assign all roles (highly privileged) )
    8) Configure Service connection manually using these details in Azure DevOps

