<%-- 
    Document   : procNuevoSmart
    Created on : 13-feb-2020, 22:24:58
    Author     : Matt WorkStation
--%>
<%@page import="java.util.Enumeration"%>
<%@page import="org.hibernate.Session"%> 
<%@page import="org.hibernate.Transaction"%> 
<%@page import="org.hibernate.Query"%> 
<%@page import="org.hibernate.Session"%> 
<%@page import="org.hibernate.Transaction"%> 
<%@page import="org.hibernate.Query"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<jsp:useBean id="smart" scope="request" class="hiber.Smartphone"/> 
<jsp:setProperty name="smart" property="*"/> 
<!DOCTYPE html> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
		<title>Creación de sede</title> 
	</head> 
	<body> 
            <%
                Enumeration x = request.getParameterNames();
            %>
		<% 
			hiber.Smartphone smartBean = (hiber.Smartphone) request.getAttribute("smart"); 
                        System.out.println("NuevoSmart_Modelo: " + smartBean.getModelo());
                        System.out.println("NuevoSmart_Version: " + smartBean.getVer());
                        System.out.println("NuevoSmart_Bateria: " + smartBean.getBateria());
                        System.out.println("NuevoSmart_Firmware: " + smartBean.getFirmware());
			if (smartBean == null) { 
		%> 
			ERROR: no se proporcionaron datos del Smartphone para crear.
		<% } 
			else { 
				Transaction t = null; 
				try { 
                                        Session s = hiber.NewHibernateUtil.getInstance().getSessionFactory().openSession();
					t = s.beginTransaction(); 
					s.save(smartBean); 
					t.commit(); 
					%>
					Creada nuevo Smartphone:<%=smartBean.getModelo()%><br/> 
					<a href="controlador">Volver</a> 
				<% } 
				catch (Exception e) { 
                                    e.printStackTrace(System.err); 
				if (t != null) { 
					t.rollback(); 
				}
			} 
		} %> 
	</body> 
</html>  
