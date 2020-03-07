/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Matt Workstation
 */
@WebServlet(name = "controlador", urlPatterns = {"/controlador"}, initParams = {
    @WebInitParam(name = "op", value = "")})
public class controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String oper = request.getParameter("op");
        if (oper == null) {
            oper = "";
        }

        RequestDispatcher rd;

        switch(oper){
            case "altaSmart":
                response.sendRedirect("frmNuevoSmart.jsp");
                break;
            case "altaDep":
                response.sendRedirect("procNuevoSmart.jsp");
                break;
            case "insertSmart":
                rd = request.getRequestDispatcher("procNuevoSmart.jsp");
                rd.forward(request, response);
                break;
            case "muestraSmart":
                rd = request.getRequestDispatcher("muestraSmart.jsp");
                rd.forward(request, response);
                break;
            default:
                System.out.println("Default");
                if ("borraSmart".equals(oper)) {
                    System.out.println("Entra en borrar");
                    try { 
                            Session s = hiber.NewHibernateUtil.getInstance().getSessionFactory().openSession();
                            s.beginTransaction();
                            hiber.Smartphone aux = new hiber.Smartphone();
                            aux.setId(Integer.parseInt(request.getParameter("id")));
                            aux.setModelo("");
                            aux.setFirmware("");
                            s.delete(aux);
                            s.getTransaction().commit();
                            s.close();
                     } 
                    catch (Exception e) { 
                        e.printStackTrace(System.err); 
                    }
                }else if ("updateSmart".equals(oper)) {
                    hiber.Smartphone aux = new hiber.Smartphone();
                    aux.setId(Integer.parseInt(request.getParameter("id")));
                    aux.setModelo(request.getParameter("modelo"));
                    aux.setBateria(Integer.parseInt(request.getParameter("bateria")));
                    aux.setFirmware(request.getParameter("firmware"));
                    aux.setVer(Integer.parseInt(request.getParameter("ver")));
                    Transaction t = null;
                    Session s = hiber.NewHibernateUtil.getInstance().getSessionFactory().openSession();
                    try  {
                        t = s.beginTransaction();
                        s.update(aux);
                        t.commit();
                    }catch (Exception e) { 
                        e.printStackTrace(System.err); 
                    }
                }
                response.sendRedirect("home.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
