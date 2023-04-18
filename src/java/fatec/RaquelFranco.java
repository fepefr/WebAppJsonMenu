package fatec;

// Classe modelo para representar o objeto JSON
public class RaquelFranco {
    private String RA;
    private String nome;
    private java.util.List<String> disciplinas;

    public RaquelFranco(String RA, String nome, java.util.List<String> disciplinas) {
        this.RA = RA;
        this.nome = nome;
        this.disciplinas = disciplinas;
    }

    public String getRA() {
        return RA;
    }

    public void setRA(String rA) {
        RA = rA;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public java.util.List<String> getDisciplinas() {
        return disciplinas;
    }

    public void setDisciplinas(java.util.List<String> disciplinas) {
        this.disciplinas = disciplinas;
    }
}

