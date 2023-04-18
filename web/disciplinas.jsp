<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="fatec.RaquelFranco" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exemplo de JSP com Servlet e JSON</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>RA</th>
                <th>Nome</th>
                <th>Disciplinas</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Faz a chamada ao servlet
                URL url = new URL("http://localhost:8080/WebAppJsonMenu/raquelfranco.json");
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");

                // Lê a resposta do servlet e converte para um objeto JSON
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String inputLine;
                StringBuffer content = new StringBuffer();
                while ((inputLine = in.readLine()) != null) {
                    content.append(inputLine);
                }
                in.close();
                conn.disconnect();
                RaquelFranco raquelFranco = new Gson().fromJson(content.toString(), RaquelFranco.class);

                // Exibe o resultado em uma tabela HTML
                out.println("<tr>");
                out.println("<td>" + raquelFranco.getRA() + "</td>");
                out.println("<td>" + raquelFranco.getNome() + "</td>");
                out.println("<td>");
                out.println("<ul>");
                List<String> disciplinas = raquelFranco.getDisciplinas();
                for (String disciplina : disciplinas) {
                    out.println("<li>" + disciplina + "</li>");
                }
                out.println("</ul>");
                out.println("</td>");
                out.println("</tr>");
            %>
        </tbody>
    </table>
</body>
</html>

