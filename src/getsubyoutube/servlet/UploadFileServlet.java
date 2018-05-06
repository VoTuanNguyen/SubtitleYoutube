package getsubyoutube.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.catalina.Session;

@WebServlet("/uploadFile")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 500, // 10MB
maxRequestSize = 1024 * 1024 * 1000)
// 50MB
public class UploadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final String SAVE_DIRECTORY = "uploadDir";

	public UploadFileServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/uploadFile.jsp");

		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		try {
			// String description = request.getParameter("description");
			// System.out.println("Description: " + description);

			// Đường dẫn tuyệt đối tới thư mục gốc của web app.
			String appPath = request.getServletContext().getRealPath("");
			// String appPath = "http://luciferwilling.ddns.net/HostSaveFile";
			// System.out.println("Path: " + appPath);
			appPath = appPath.replace('\\', '/');

			// Thư mục để save file tải lên.
			String fullSavePath = null;
			if (appPath.endsWith("/")) {
				fullSavePath = appPath + SAVE_DIRECTORY;
			} else {
				fullSavePath = appPath + "/" + SAVE_DIRECTORY;
			}

			// Tạo thư mục nếu nó không tồn tại.
			File fileSaveDir = new File(fullSavePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}

			// Danh mục các phần đã upload lên (Có thể là nhiều file).
			int i = 0;
			String namevideo="", namesub="";
			HttpSession session = request.getSession();
			for (Part part : request.getParts()) {
				i++;
				String fileName = extractFileName(part);
				if (fileName != null && fileName.length() > 0) {
					String filePath = fullSavePath + File.separator + fileName;
					System.out.println("Write attachment to file: "
							+ filePath.replace("\\", "/"));

					// Ghi vào file.
					part.write(filePath);
					String[] lst = filePath.replace("\\", "/").split("/");
					String value = lst[lst.length - 1];
					System.out.println("Link: " + value);
					if (i == 1) {
						namevideo = value;
					} else {
						namesub = value;
					}
				}
			}
			// Upload thành công thì chuyển sang trang học bài
			response.sendRedirect(request.getContextPath()
					+ "/videolocal?namevideo="+namevideo+"&namesub="+namesub);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Error: " + e.getMessage());
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/WEB-INF/jsps/uploadFile.jsp");
			dispatcher.forward(request, response);
		}
	}

	private String extractFileName(Part part) {
		// form-data; name="file"; filename="C:\file1.zip"
		// form-data; name="file"; filename="C:\Note\file2.zip"
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				// C:\file1.zip
				// C:\Note\file2.zip
				String clientFileName = s.substring(s.indexOf("=") + 2,
						s.length() - 1);
				clientFileName = clientFileName.replace("\\", "/");
				int i = clientFileName.lastIndexOf('/');
				// file1.zip
				// file2.zip
				return clientFileName.substring(i + 1);
			}
		}
		return null;
	}

}