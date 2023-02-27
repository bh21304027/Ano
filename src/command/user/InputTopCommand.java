package command.user;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bean.ShoesBean;
import command.AbstractCommand;
import context.RequestContext;
import context.ResponseContext;
import dao.connectionmanager.ConnectionManager;
import dao.factory.AbstractDaoFactory;
import dao.product.ProductInformationDao;

public class InputTopCommand extends AbstractCommand{

	@Override
	public ResponseContext execute(ResponseContext resc) {
		RequestContext reqc = getRequestContext();
		HttpServletRequest req = (HttpServletRequest) reqc.getRequest();
		HttpSession session = req.getSession();
		ArrayList<ShoesBean> list= new ArrayList<>();

		ConnectionManager.getInstance("mysql").beginTransaction();

		AbstractDaoFactory factory = AbstractDaoFactory.getFactory("mysql");
		ProductInformationDao pid = factory.getProductInformationDao();


		Random r = new Random();
		for(int i = 0;i < 4; i++) {

			int randomvalue=r.nextInt(24)+1;



			ShoesBean sb = pid.getProductListInformationRandom(randomvalue);


		list.add(sb);
		}
		ConnectionManager.getInstance("mysql").commit();

		ConnectionManager.getInstance("mysql").closeConnection();

		resc.setResult(list);

		req.setAttribute("message", session.getAttribute("message"));
		session.removeAttribute("message");
		System.out.print("message:"+session.getAttribute("message"));


		resc.setTarget("top");
		return resc;
	}

}