package pe.edu.unmsm.sistemas.serviceImpl;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.JSONArray;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.client.RestTemplate;

import com.google.cloud.firestore.Firestore;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import pe.edu.unmsm.sistemas.service.LoginService;

@Service("LoginService")
public class LoginServiceImplementation implements LoginService{

	public FirebaseOptions options;
	public FirebaseApp fba;
	public Firestore db;
	public boolean inicializado=false;
	
	private static String base_rest = "https://firestore.googleapis.com/v1beta1/projects/proyectosegsil/databases/(default)/documents/";

	@Override
	public String verifyLogin(String usuario, String contrasenia, HttpSession session, Model model) throws InterruptedException, ExecutionException, IOException {
		session.setAttribute("loginError","");
		String rpta = "showLoginForm";
		String uri = base_rest + ":runQuery";
		RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.postForObject( uri, "{\r\n" + 
	    		"    \"structuredQuery\": {\r\n" + 
	    		"    	\"select\": { \"fields\": [ {\"fieldPath\": \"id\"}, ],	},\r\n" + 
	    		"        \"where\" : {\r\n" + 
	    		"        	\"compositeFilter\" :\r\n" + 
	    		"        	{\r\n" + 
	    		"        		\"op\": \"AND\",\r\n" + 
	    		"        		\"filters\": [\r\n" + 
	    		"	    			{ \"fieldFilter\" : { \"field\": {\"fieldPath\": \"id\"}, \"op\":\"EQUAL\", \"value\": {\"stringValue\": \"" + usuario + "\"} } },\r\n" + 
	    		"	    			{ \"fieldFilter\" : { \"field\": {\"fieldPath\": \"password\"}, \"op\":\"EQUAL\", \"value\": {\"stringValue\": \"" + contrasenia + "\"} } },\r\n" + 
	    		"    			],\r\n" + 
	    		"        	}\r\n" + 
	    		"        },\r\n" + 
	    		"        \"from\": [{\"collectionId\": \"usuarios\"}]\r\n" + 
	    		"    }\r\n" + 
	    		"}", String.class);
	    JSONObject jsonObj = new JSONObject(result.replace("[", "").replace("]", ""));
    	if(jsonObj.has("document"))
    	{
	    	usuario = jsonObj.getJSONObject("document").getJSONObject("fields").getJSONObject("id").getString("stringValue");
	    	session.setAttribute("usersession",usuario);	    	
	    	rpta="menu";
			return "redirect:/"+rpta;
    	}else {
    		session.setAttribute("loginError","Usuario o clave incorrecto.");
    	}    	
		return "redirect:/";
	}
	public String obtenerUsuario(HttpSession session) {
		String usuario = (String) session.getAttribute("usersession");
		return usuario;
	}
	public String listarMenuOpciones(HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException {
		String uri = base_rest + "usuarios/" + session.getAttribute("usersession");
		RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.getForObject(uri, String.class);
		JSONObject jsonObj = new JSONObject(result);
		String jsonStr=null;
		if(jsonObj.getJSONObject("fields").has("perfil"))
		{
			jsonStr = jsonObj.getJSONObject("fields").getJSONObject("perfil").getJSONObject("mapValue").getJSONObject("fields").toString();
		}
		return jsonStr;
	}	
	public String listarCursosPorCoordinador(HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException {
		String uri = base_rest + ":runQuery";
		RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.postForObject( uri, "{\r\n" + 
	    		"    \"structuredQuery\": {\r\n" + 
	    		"    	\"select\": { \"fields\": [ {\"fieldPath\": \"id\"}, {\"fieldPath\": \"nombreCurso\"}, ], },\r\n" + 
	    		"        \"where\" : { \"fieldFilter\" : { \"field\": {\"fieldPath\": \"idCoordinador\"}, \"op\":\"EQUAL\", \"value\": {\"stringValue\": \"" + session.getAttribute("usersession") + "\"} }, },\r\n" + 
	    		"        \"from\": [{\"collectionId\": \"cursos\"}]\r\n" + 
	    		"    }\r\n" + 
	    		"}", String.class);
		String listaDeCursos = " ";
		JSONObject jsonObj = new JSONObject();
	    JSONArray list_json = new JSONArray(result);
	    for(int i=0;i<list_json.length();i++)
	    {
	    	jsonObj = list_json.getJSONObject(i);
	    	if(jsonObj.has("document"))
	    		if(jsonObj.getJSONObject("document").has("fields"))
	    		{
	    			listaDeCursos += "{ \"id\":\"" + jsonObj.getJSONObject("document").getJSONObject("fields").getJSONObject("id").getString("stringValue")
	    							+ "\", \"nombreCurso\":\"" + jsonObj.getJSONObject("document").getJSONObject("fields").getJSONObject("nombreCurso").getString("stringValue") + "\"},";
	    		}
	    }
	    listaDeCursos = "[" + listaDeCursos.substring(0, listaDeCursos.length()-1) + "]";
	    return listaDeCursos;
	}
	//Unidad dicatica
	public String listarUnidadDidactica(HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException {		
		String uri = base_rest + "silabus/" + session.getAttribute("idCurso") + "/unidades";
		RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.getForObject( uri, String.class);
	    
	    return result; 
	}
	public String guardarUnidadDidactica(String idUD, String idSE, Integer rows, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException {		
		String result = "-1";
		int cant_semanas = 0;
		RestTemplate restTemplate = new RestTemplate();
		
		//get_semanas
		cant_semanas = get_semanas(restTemplate, session);
	    
	    //set_semanas
	    set_semanas(restTemplate, Integer.parseInt(idSE), cant_semanas, rows, session);
	    
		String uri = base_rest + "silabus/" + session.getAttribute("idCurso") + "/unidades?documentId="+(rows+1);
		
	    result = restTemplate.postForObject( uri, "{\r\n" + 
	    		"      \"fields\": {\r\n" + 
	    		"        \"nombre\": { \"stringValue\": \"UNIDAD " + idUD + "\" },\r\n" + 
	    		"        \"numero\": { \"integerValue\": \"" + (rows+1) + "\" },\r\n" +
	    		"        \"semanas\": { \"integerValue\": \"" + idSE + "\" }\r\n" +
	    		"      }\r\n" + 
	    		"}", String.class);
	    return result;
	}
	public String editarUnidadDidactica(String idEditIdUD, String idEditUD, String idEditCantSem, HttpSession session) throws IOException, InterruptedException, ExecutionException
	{
		String uri = "https://firestore.googleapis.com/v1beta1/" + idEditIdUD + "?updateMask.fieldPaths=nombre&updateMask.fieldPaths=semanas";
		
		HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
	    RestTemplate restTemplate = new RestTemplate(requestFactory);
	    String result = restTemplate.patchForObject(uri, "{\r\n" + 
	    		"      \"fields\": {\r\n" + 
	    		"        \"nombre\": { \"stringValue\": \"" + idEditUD + "\" },\r\n" + 
	    		"        \"semanas\": { \"integerValue\": \"" + idEditCantSem + "\" }\r\n" + 
	    		"      }\r\n" + 
	    		"}", String.class);	 
	    
	    return result;
	}
	public Integer get_semanas(RestTemplate rt, HttpSession session) {
		int cs = 0;
		String uri = base_rest + "silabus/" + session.getAttribute("idCurso") + ":runQuery";
		String semanas = rt.postForObject( uri, "{\r\n" + 
				"    \"structuredQuery\": {\r\n" + 
				"    	\"select\": { \"fields\": [ {\"fieldPath\": \"semanas\"}] , },\r\n" + 
				"        \"from\": [{\"collectionId\": \"unidades\"}]\r\n" + 
				"    }\r\n" + 
				"}", String.class);
		JSONObject jsonObj = new JSONObject();
	    JSONArray list_json = new JSONArray(semanas);
	    for(int i=0;i<list_json.length();i++)
	    {
	    	jsonObj = list_json.getJSONObject(i);
	    	if(jsonObj.has("document"))
	    	{
	    		if(jsonObj.getJSONObject("document").has("fields"))
	    		{
	    			cs += jsonObj.getJSONObject("document").getJSONObject("fields").getJSONObject("semanas").getInt("integerValue");
	    		}
	    	}
	    	else break;
	    }
	    return cs;
	}
	public void set_semanas(RestTemplate rt, Integer semanas, Integer cant_semanas, Integer rows, HttpSession session) {
		String uri = "";
		for(int i=1; i<=semanas; i++)
	    {
		    uri = base_rest + "silabus/" + session.getAttribute("idCurso") + "/semanas?documentId="+(cant_semanas+i);
		    rt.postForObject( uri, "{\r\n" + 
		    		"      \"fields\": {\r\n" + 
		    		"        \"llenado\": { \"booleanValue\": false},\r\n" + 
		    		"        \"numero\": { \"integerValue\": \"" + (cant_semanas+i) + "\" },\r\n" +
		    		"        \"unidad\": { \"integerValue\": \"" + (rows+1) + "\" }\r\n" +
		    		"      }\r\n" + 
		    		"}", String.class);
	    }
	}
	//Tema
	public String listarSemanas(Integer unidad, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException {		
		String uri = base_rest + "silabus/" + session.getAttribute("idCurso") + ":runQuery";
		RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.postForObject( uri, "{\r\n" + 
	    		"    \"structuredQuery\": {\r\n" + 
	    		"        \"where\" : {\r\n" + 
	    		"            \"fieldFilter\" : { \r\n" + 
	    		"                \"field\": {\"fieldPath\": \"unidad\"}, \r\n" + 
	    		"                \"op\":\"EQUAL\", \r\n" + 
	    		"                \"value\": {\"integerValue\": " + unidad + "}\r\n" + 
	    		"            }\r\n" + 
	    		"        },\r\n" + 
	    		"        \"from\": [{\"collectionId\": \"semanas\"}]\r\n" + 
	    		"    }\r\n" + 
	    		"}", String.class);
	    return result; 
	}
	public String listarTemas(Integer semana, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException {		
		String uri = base_rest + "silabus/" + session.getAttribute("idCurso") + "/semanas/" + semana + "/temas";
		RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.getForObject( uri, String.class);
	    
	    return result; 
	}
	public String guardarTema(Integer semana, String tema, Integer rows, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException {		
		String result = "-1";		
		String uri = base_rest + "silabus/" + session.getAttribute("idCurso") + "/semanas/" + semana + "/temas?documentId="+ (rows+1);
		RestTemplate restTemplate = new RestTemplate();
	    result = restTemplate.postForObject( uri, "{\r\n" + 
	    		"      \"fields\": {\r\n" + 
	    		"        \"nombre\": { \"stringValue\": \"" + tema + "\" },\r\n" + 
	    		"        \"numero\": { \"integerValue\": \"" + (rows+1) + "\" }\r\n" + 
	    		"      }\r\n" + 
	    		"}", String.class);
	    return result;
	}	
	public String editarTema(String idEditIdTem, String idEditTem, HttpSession session) throws IOException, InterruptedException, ExecutionException
	{
		String uri = "https://firestore.googleapis.com/v1beta1/" + idEditIdTem  + "?updateMask.fieldPaths=nombre";
		
		HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
	    RestTemplate restTemplate = new RestTemplate(requestFactory);
	    String result = restTemplate.patchForObject(uri, "{\r\n" + 
	    		"      \"fields\": {\r\n" + 
	    		"        \"nombre\": { \"stringValue\": \"" + idEditTem + "\" }\r\n" + 
	    		"      }\r\n" + 
	    		"}", String.class);	    
	    return result;
	}
	//////
	public String listarActividades(Integer semana, Integer tema, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException {		
		String uri = base_rest + "silabus/" + session.getAttribute("idCurso") + "/semanas/" + semana + "/temas/" + tema;
		RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.getForObject( uri, String.class);
	    
	    return result; 
	}
	public String guardarActividad(Integer semana, Integer tema, String vals, String act, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException {		
		String result = "-1";		
		String uri = base_rest + "silabus/" + session.getAttribute("idCurso") + "/semanas/" + semana + "/temas/" + tema + "?updateMask.fieldPaths=actividades";
		HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
	    RestTemplate restTemplate = new RestTemplate(requestFactory);
	    result = restTemplate.patchForObject(uri, "{\r\n" + 
	    		"	\"fields\": {\r\n" +  
	    		"	    \"actividades\": {\r\n" + 
	    		"	      \"arrayValue\": {\r\n" + 
	    		"	        \"values\": [\r\n" + vals + 
	    		"	          {\r\n" + 
	    		"	            \"stringValue\": \"" + act + "\"\r\n" + 
	    		"	          }\r\n" + 
	    		"	        ]\r\n" + 
	    		"	      }\r\n" + 
	    		"	    },\r\n" +  
	    		"	}\r\n" + 
	    		"}", String.class);
	    
	    return result;
	}
	public String editarActividad(Integer semana, Integer tema, String idActOld, String IdEditAct, String vals, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException{
		String result = "-1";		
		String uri = base_rest + "silabus/" + session.getAttribute("idCurso") + "/semanas/" + semana + "/temas/" + tema + "?updateMask.fieldPaths=actividades";
		HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
	    RestTemplate restTemplate = new RestTemplate(requestFactory);
	    result = restTemplate.patchForObject(uri, "{\r\n" + 
	    		"	\"fields\": {\r\n" + 
	    		"	    \"actividades\": {\r\n" + 
	    		"	      \"arrayValue\": {\r\n" + 
	    		"	        \"values\": [\r\n" + vals.replaceAll(idActOld, IdEditAct) +
	    		"	        ]\r\n" + 
	    		"	      }\r\n" + 
	    		"	    },\r\n" +  
	    		"	}\r\n" + 
	    		"}", String.class);
	    
	    return result;
	}
}
