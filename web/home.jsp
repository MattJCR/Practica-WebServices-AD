<%-- 
    Document   : Home
    Created on : 13-feb-2020, 22:24:58
    Author     : Matt WorkStation
--%>

<%@page import= "org.hibernate.Session" %>
<%@page import= "java.util.List" %>
<%@page import= "org.hibernate.Query" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form name="frm_muestra_smart" method="post" action="controlador">
            <input type="hidden" name="op" value="muestraSmart">
            <input type="hidden" name="id">
            <table border="1">
                <tr<td colspan="2" align="center"> Smartphones [<a href="javascript:void(0)" onclick="javascript:document.frm_muestra_smart.op.value='altaSmart'; document.frm_muestra_smart.submit();">Nuevo Smartphone</a>]</td></tr>
                <%
                    Session s = hiber.NewHibernateUtil.getInstance().getSessionFactory().openSession();
                    try{
                        Query q = s.createQuery("FROM Smartphone ORDER BY "
                                + "modelo,id").setReadOnly(true);
                        List<hiber.Smartphone> listaSmart = (List<hiber.Smartphone>) 
                                q.list();
                        if(listaSmart.isEmpty()) { %>
                        <tr><td colspan="2">No existen Smartphones</td></tr>
                        <%
                    } else {
                        for(hiber.Smartphone smart: listaSmart){%>
                        <tr>
                            <td><%=smart.getId()%></td>
                            <td><a href="javascript:void(0)" onclick="javascript:document.frm_muestra_smart.id.value = '<%=smart.getId()%>'; 
                                document.frm_muestra_smart.submit()"><%=smart.getModelo()%></a></td>
                            <td><%=smart.getBateria()%></td>
                            <td><%=smart.getFirmware()%></td>
                            <td><a href="javascript:void(0)" onclick="javascript:document.frm_muestra_smart.op.value='borraSmart'; 
                                javascript:document.frm_muestra_smart.id.value='<%=smart.getId()%>'; 
                                document.frm_muestra_smart.submit();">Borrar</a></td>
                        </tr>
                    <%    
                }
            }
        }catch (Exception e){
            e.printStackTrace(System.err);
        }
        %>      
            </table>
    </body>
</html>
