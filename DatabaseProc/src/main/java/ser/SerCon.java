package ser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SerDAO;
import dto.SerDTO;


@WebServlet("*.con")
public class SerCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String cmd = request.getServletPath();
		SerDAO dao = SerDAO.getInstance();
		try {
			if(cmd.equals("/var.con")) {
				SerDTO dto = dao.selectAll();
				System.out.println(dto.getName());
			} else if (cmd.equals("/varin.con")) {
				int result = dao.insert();
				System.out.println(result);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
