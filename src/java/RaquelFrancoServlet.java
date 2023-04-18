import fatec.RaquelFranco;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.google.gson.Gson; // importe a biblioteca Gson
import jakarta.servlet.annotation.WebServlet;

@WebServlet(value = "/raquelfranco.json") 
public class RaquelFrancoServlet extends HttpServlet {

    // Método para tratar solicitações HTTP GET
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // Verifique se a URL solicitada é "/raquelfranco.json"
        if (request.getRequestURI().endsWith("/raquelfranco.json")) {

            // Crie um objeto JSON com os campos e valores especificados
            RaquelFranco raquelFranco = new RaquelFranco("12345", "Raquel F. Batista Franco",
                    Arrays.asList("Sistemas operacionais 2", "Inglês", "Engenharia de software",
                            "Bancos dados", "Metodologia científica", "Programação orientada obj",
                            "Linguagem de programação PHP"));

            // Defina o tipo de conteúdo da resposta como "application/json"
            response.setContentType("application/json");

            // Escreva o objeto JSON na resposta usando o método PrintWriter
            PrintWriter out = response.getWriter();
            out.print(new Gson().toJson(raquelFranco));
            out.flush();
            out.close();
        }
    }
}