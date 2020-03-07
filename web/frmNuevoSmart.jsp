<%-- 
    Document   : frmNuevoSmart
    Created on : 13-feb-2020, 22:24:58
    Author     : Matt WorkStation
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import= "org.hibernate.Session" %>
<%@page import= "java.util.List" %>
<%@page import= "org.hibernate.Query" %>
<jsp:useBean id="smart" scope="request" class="hiber.Smartphone"/> 
<jsp:setProperty name="smart" property="*"/> 
<!DOCTYPE html> 
<html> 
	<head> 
		<meta http-equiv="ContentType" content="text/html; charset=UTF-8"> 
		<title>Alta de Sede</title> 
	</head>
	<body> 
		<form method="post" action="controlador"> 
			<table> 
				<tr> 
					<td> 
                                            <input type="hidden" name="op" method="post" value="insertSmart"/> 
                                            modelo: 
                                            <input name="modelo" required method="post" type="text" size="20"  maxlength="20"/> 
					</td> 
                                        <td> 
                                            version:
                                            <input name="ver" required method="post" type="text" size="20"  maxlength="20"/> 
					</td>
                                        <td> 
                                            bateria: 
                                            <input name="bateria" required method="post" type="text" size="20"  maxlength="20"/> 
					</td>
                                        <td> 
                                            firmware: 
                                            <input name="firmware" required method="post" type="text" size="20"  maxlength="20"/> 
					</td>
				</tr> 
				<tr> 
					<td> 
						<input type="submit" value="Crear"/> 
						<input type="reset" name="cancelar" value="Cancelar"/> 
					</td> 
				</tr> 
			</table> 
                        
		</form> 
		<a href="controlador">Inicio</a> 
	</body> 
</html> 