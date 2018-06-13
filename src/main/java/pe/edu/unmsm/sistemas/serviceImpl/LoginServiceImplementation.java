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

	//FileInputStream serviceAccount;
	public FirebaseOptions options;
	public FirebaseApp fba;
	public Firestore db;
	public boolean inicializado=false;
	
	private static String base_rest = "https://firestore.googleapis.com/v1beta1/projects/proyectosegsil/databases/(default)/documents/";

	@Override
	public String verifyLogin(String usuario, String contrasenia, HttpSession session, Model model) throws InterruptedException, ExecutionException, IOException {
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
		    //Gson gsonObj = new Gson();
	    	usuario = jsonObj.getJSONObject("document").getJSONObject("fields").getJSONObject("id").getString("stringValue");
	    	session.setAttribute("usersession",usuario);
	    	rpta="menu";
			return "redirect:/"+rpta;
    	}
		/*ClassLoader classLoader = getClass().getClassLoader();
		File file = new File(classLoader.getResource("proyectosegsil.json").getFile());
		if(!inicializado) {
			FirestoreOptions firestoreOptions =
			        FirestoreOptions.getDefaultInstance().toBuilder()
			        	.setCredentials(GoogleCredentials.fromStream(new FileInputStream(file)))
			            .setProjectId("proyectosegsil")
			            .build();
			
			db = firestoreOptions.getService();
			inicializado=true;
		}		
		ApiFuture<QuerySnapshot> query = db.collection("usuarios").get();
		QuerySnapshot querySnapshot = query.get();
		List<QueryDocumentSnapshot> documents = querySnapshot.getDocuments();
		for (QueryDocumentSnapshot document : documents) {
		  if(document.get("id").equals(usuario)) {
			  if(document.get("password").equals(contrasenia)) {
				  session.setAttribute("usersession",usuario);
				  rpta="menu";
				  return "redirect:/"+rpta;
			  }
		  }
		}
		model.addAttribute("loginError","Usuario o contrase�a errado.");*/
		return "redirect:/";
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
	    /*Gson gsonObj = new Gson();
		String id = (String) session.getAttribute("usersession");
		DocumentReference docRef = db.collection("usuarios").document(id);
		ApiFuture<DocumentSnapshot> future = docRef.get();
		DocumentSnapshot document = future.get();
	    
		String jsonStr=null;
		if (document.exists()) {
		  jsonStr = gsonObj.toJson(document.get("perfil"));
		} else {
		  System.out.println("No hay documentos");
		}*/
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
	    //List<JSONObject> jsonObj = new List<JSONObject>(result);
		/*Gson gsonObj = new Gson();
		String idCoordinador = (String) session.getAttribute("usersession");
		String jsonStr=null;
		String listaDeCursos="";
		ApiFuture<QuerySnapshot> future = db.collection("cursos").get();
		List<QueryDocumentSnapshot> documents = future.get().getDocuments();
		for (QueryDocumentSnapshot document : documents) {
		  String idCurso = document.getId();		  
		  DocumentReference docRef1 = db.collection("cursos").document(idCurso);
			ApiFuture<DocumentSnapshot> future1 = docRef1.get();
			DocumentSnapshot document1 = future1.get();
			if (document1.exists()) {			  
			  if(idCoordinador.equals(document1.getString("idCoordinador"))) {
				  listaDeCursos = listaDeCursos + "{ \"id\":\"" + document.getId() + "\", \"nombreCurso\":\"" + document1.getString("nombreCurso") + "\"},";
			  }
			} else {
			  System.out.println("No hay documentos");
			}
		}
		listaDeCursos = listaDeCursos.substring(0, listaDeCursos.length()-1);
		jsonStr = gsonObj.toJson("[" + listaDeCursos + "]");
		return jsonStr;*/
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
		String uri = base_rest + "silabus/" + session.getAttribute("idCurso") + "/unidades?documentId="+(rows+1);
		RestTemplate restTemplate = new RestTemplate();
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
		String uri = "https://firestore.googleapis.com/v1beta1/" + idEditIdUD;
		
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
	public String editarTema(String idEditIdUD, String idEditUD, String idEditCantSem, HttpSession session) throws IOException, InterruptedException, ExecutionException
	{
		String uri = "https://firestore.googleapis.com/v1beta1/" + idEditIdUD;
	    RestTemplate restTemplate = new RestTemplate();
	    String result = restTemplate.patchForObject(uri, "{\r\n" + 
	    		"      \"fields\": {\r\n" + 
	    		"        \"nombre\": { \"stringValue\": \"" + idEditUD + "\" },\r\n" + 
	    		"        \"numero\": { \"integerValue\": \"" + idEditCantSem + "\" }\r\n" + 
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
	public String guardarActividad(Integer semana, Integer temaid, String tema, String vals, String act, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException {		
		String result = "-1";		
		String uri = base_rest + "silabus/" + session.getAttribute("idCurso") + "/semanas/" + semana + "/temas/" + temaid;
		HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory();
	    RestTemplate restTemplate = new RestTemplate(requestFactory);
	    result = restTemplate.patchForObject(uri, "{\r\n" + 
	    		"	\"fields\": {\r\n" + 
	    		"	    \"numero\": { \"integerValue\": \"" + temaid + "\" },\r\n" + 
	    		"	    \"actividades\": {\r\n" + 
	    		"	      \"arrayValue\": {\r\n" + 
	    		"	        \"values\": [\r\n" + vals + 
	    		"	          {\r\n" + 
	    		"	            \"stringValue\": \"" + act + "\"\r\n" + 
	    		"	          }\r\n" + 
	    		"	        ]\r\n" + 
	    		"	      }\r\n" + 
	    		"	    },\r\n" + 
	    		"	    \"nombre\": { \"stringValue\": \"" + tema + "\" }\r\n" + 
	    		"	}\r\n" + 
	    		"}", String.class);
	    
	    return result;
	}
}
