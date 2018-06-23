package pe.edu.unmsm.sistemas.service;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface LoginService {
	
	public String verifyLogin(String usuario, String contrasenia, HttpSession session, Model model) throws InterruptedException, ExecutionException, IOException;
	public String obtenerUsuario(HttpSession session);
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
	public String editarTema(String idEditIdTem, String idEditTem, HttpSession session) throws IOException, InterruptedException, ExecutionException;
	//Actividad
	public String listarActividades(Integer semana, Integer tema, String turno, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	public String guardarActividad(Integer semana, Integer tema, String vals, String act, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	public String editarActividad(Integer semana, Integer tema, String idActOld, String IdEditAct, String vals, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	
	public String getObs(Integer semana, String turno, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	public String updateRespuesta(Integer semana, Integer tema, String turno, boolean val, Integer indice, Integer rows, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	public String updateObs(Integer semana, String turno, String val, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException;
	
}


