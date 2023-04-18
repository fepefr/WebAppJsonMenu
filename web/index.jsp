<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*, java.net.*, com.google.gson.Gson" %>
<%@ page import="fatec.RaquelFranco" %>

<%@include file="WEB-INF/jspf/header.jspf" %>
<%
// faz a chamada para a API REST e recupera os dados JSON
URL url = new URL("http://localhost:8080/WebAppJsonMenu/raquelfranco.json");
URLConnection conn = url.openConnection();
BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
StringBuilder sb = new StringBuilder();
String line;
while ((line = reader.readLine()) != null) {
    sb.append(line);
}
reader.close();
String json = sb.toString();

RaquelFranco raquelFranco = new Gson().fromJson(json, RaquelFranco.class);

// exibe os dados na página
out.println("<p>Dados do Serviço REST:</p>");
out.println("<ul>");
out.println("<li>Nome: " + raquelFranco.getNome() + "</li>");
out.println("<li>RA " + raquelFranco.getRA() + "</li>");
out.println("</ul>");
%>

