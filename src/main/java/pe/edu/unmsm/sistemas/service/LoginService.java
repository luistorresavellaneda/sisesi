package pe.edu.unmsm.sistemas.service;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface LoginService {
	
	public String verifyLogin(String usuario, String contrasenia, HttpSession session, Model model) throws InterruptedException, ExecutionException, IOException;
	public String listarMenuOpciones(HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	public String listarCursosPorCoordinador(HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	//Unidad didactica
	public String listarUnidadDidactica(HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	public String guardarUnidadDidactica(String idUD, String idSE, Integer rows, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	public String editarUnidadDidactica(String idEditIdUD, String idEditUD, String idEditCantSem, HttpSession session) throws IOException, InterruptedException, ExecutionException;
	//Tema
	public String listarSemanas(Integer unidad, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	public String listarTemas(Integer semana, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	public String guardarTema(Integer semana, String tema, Integer rows, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	public String listarActividades(Integer semana, Integer tema, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	public String guardarActividad(Integer semana, Integer temaid , String tema, String vals, String act, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	
}


