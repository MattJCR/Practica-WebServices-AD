<%-- 
    Document   : muestraSmart
    Created on : 21-feb-2020, 12:16:12
    Author     : Matt Workstation
--%>
<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="smart" scope="request" class="hiber.Smartphone"/>
<jsp:setProperty name="smart" property="*"/>

<%
    System.out.println("DEBUG MUESTRA: " + request.getAttribute("smart"));
    hiber.Smartphone smartBean = (hiber.Smartphone) request.getAttribute("smart");
    if (smartBean == null) {
%>
ERROR: no se especific&oacute; Smartphone a mostrar.
<%
} else {
    try{
        System.out.println("DEBUG MUESTRA: " + smartBean.getId());
        System.out.println("DEBUG MUESTRA: " + smartBean.getModelo());
        System.out.println("DEBUG MUESTRA: " + smartBean.getBateria());
        System.out.println("DEBUG MUESTRA: " + smartBean.getFirmware());
        Session s = hiber.NewHibernateUtil.getInstance().getSessionFactory().openSession();
        s.refresh(smartBean);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smartphone <%=smartBean.getId()%> - <%=smartBean.getModelo()%></title>
    </head>
    <body>
        <p>Smartphone: <%=smartBean.getId()%> - <%=smartBean.getModelo()%></p>
        <form method="post" action="controlador">
            <input type="hidden" name="op" value="updateSmart"/>
            <table>
                <tr>
                    <td>Id: </td>
                    <td><input type="text" readonly="true"  name ="id" value="<%=smartBean.getId()%>"/></td>
                </tr>
                <tr>
                    <td>Modelo</td>
                    <td><input name="modelo" required type="text" size="20" maxlength="20" value="<%=smartBean.getModelo()%>"/></td>
                </tr>
                <tr>
                    <td>Bateria</td>
                    <td><input name="bateria" required type="text" size="20" maxlength="50" value="<%=smartBean.getBateria()%>"/></td>
                </tr>
                <tr>
                    <td>Version</td>
                    <td><input name="ver" required type="text" size="20" maxlength="30" value="<%=smartBean.getVer()%>"/></td>
                </tr>
                <tr>
                    <td>Firmware: </td>
                    <td><input name="firmware"  type="text" size="20" maxlength="30" value="<%=smartBean.getFirmware()%>"/></td>
                </tr>
                
                <tr>
                    <td>
                        <input type="submit" value="Modificar"/>
                        <input type="reset" name="cancelar" value="Cancelar"/>
                    </td>
                </tr>
            </table>
            <a href="controlador">Volver</a>
        </form>
    </body>
</html>
<%
        } catch (Exception e) {
            e.printStackTrace(System.err);
        }
    }
%>