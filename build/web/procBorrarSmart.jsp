<%-- 
    Document   : procBorrarSmart
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
		<title>Borrado de Smartphone</title> 
	</head> 
	<body> 
            <%
                Enumeration x = request.getParameterNames();
            %>
		<% 
			hiber.Smartphone smartBean = (hiber.Smartphone) request.getAttribute("smart"); 
			if (smartBean == null) { 
		%> 
			ERROR: no se proporcionaron datos del Smartphone para borrar.
		<% } 
			else { 
				Transaction t = null; 
				try { 
                                        Session s = hiber.NewHibernateUtil.getInstance().getSessionFactory().openSession();
					t = s.beginTransaction(); 
                                        s.delete(smartBean);
					t.commit(); 
					%>
					Smartphone borrado: [<%=smartBean.getId()%>] <%=smartBean.getModelo()%><br/> 
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

