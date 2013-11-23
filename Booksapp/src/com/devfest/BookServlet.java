package com.devfest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.devfest.model.Book;
import com.devfest.model.Person;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.images.Image;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.appengine.api.images.Transform;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class BookServlet extends HttpServlet {
	private Logger log=Logger.getLogger(BookServlet.class.getName());
	private PersistenceManager pm;

	public BookServlet() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		pm=PMF.get().getPersistenceManager();
		try{
		Query query=pm.newQuery(Book.class);
		List<Book> books = new ArrayList<Book>(); 
		
		books.addAll((List<Book>)query.execute());
		for(int i=0;i<books.size();i++)
		{
			System.out.println("person is : "+books.get(i).getPerson().getEmail());
		}
		log.info(" list size is : "+books.size());
        req.setAttribute("allbooks", books);
		} catch(Exception ex)
		{
			log.info("here I am in the exception scetion");
			ex.printStackTrace();
		}
		finally
		{
			pm.close();
			
		}
		req.getRequestDispatcher("books.jsp").forward(req, resp);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		pm=PMF.get().getPersistenceManager();
		HttpSession session=req.getSession();
	    // get the blobStore service
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        ImagesService imagesService = ImagesServiceFactory.getImagesService();
       

        // Récupère une Map de tous les champs d'upload de fichiers
        Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);

        // Récupère le fichier uploadé dans le champ "uploadedImg"
        BlobKey blobKey = blobs.get("uploadedImg");
        
       
        
   	 String urlImage = imagesService.getServingUrl(blobKey, 280, false);

   	 Book b=new Book();
   	 b.setName(req.getParameter("name"));
   	 b.setAuthor(req.getParameter("author"));
   	 b.setDescription(req.getParameter("desc"));
   	 b.setCategory("Technologie");
   	 b.setUrlImg(urlImage);
   	 Person p=(Person) session.getAttribute("user");
   	 p.getBooks().add(b);
   	 try{
   	 pm.makePersistent(p);}
   	 finally{
   		 pm.close();
   	

	}
   	 
   	 resp.sendRedirect("/books");}
	}
	
	


