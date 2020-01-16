package com.SERVICE;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.transform.Result;

/**
 * Servlet implementation class checkCodeServlet
 */
@WebServlet("/checkCodeServlet")
public class checkCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setHeader("Pragma","No-cache");
		response.setHeader("Cache-Control","No-cache");
		response.setHeader("Expires","0");
		
		//设置响应格式
		response.setContentType("image/jpeg");
		
		//创建缓存图片
		//定义画布
		int width,height;
		width = 80;
		height = 30;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
		
		//定义画笔
		Graphics g = image.getGraphics();
		
		//生成随机数
		//建立生成随机数的对象
				Random random = new Random();
				g.setColor(getRandomColor(108, 200));//设置图片背景颜色
				
				g.fillRect(0, 0, width, height);//画了一个矩形框，坐标是(0,0);宽为60；高为20
				
				g.setColor(getRandomColor(108, 200));//设置图片背景颜色
				
				//设置字体及大小
				//g.setFont(new Font('','',''));
				
				//生成160条随机线条进行干扰
				for(int i = 0; i < 160;i++){
					int x = random.nextInt(width);
					int y = random.nextInt(height);
					int xx = random.nextInt(12);
					int yy = random.nextInt(12);
					
					g.drawLine(x, y, x+xx, y+yy);  //在坐标(x,y)和(x+xx,y+yy)之间画线
				}
				
				String strCode ="";
				for(int i = 0;i<4;i++) {
					String strNumber = String.valueOf(random.nextInt(10));
					
					strCode = strCode + strNumber;
					
					g.setColor(new Color(15+random.nextInt(108),15+random.nextInt(108),15+random.nextInt(108)));
					g.drawString(strNumber, 13*i+6, 16);
				}
				//把验证码保存大session
				request.getSession().removeAttribute("Code");
				request.getSession().setAttribute("Code", strCode);
				
				//释放资源
				g.dispose();
				//输出jpeg图片
				ImageIO.write(image, "JPEG", response.getOutputStream());
				//刷新输出流
				response.getOutputStream();
				//关闭
				response.getOutputStream().close();
				
			}
			
			//随机生成颜色
			public Color getRandomColor(int fc,int bc) {
				
				Random random = new Random();
				Color randomColor = null;
				if(fc>255) {
					fc=255;
				}
				if(bc>255) {
					bc=255;
				}
				//设置随机颜色变量
				int r = fc+random.nextInt(bc-fc);
				int g = fc+random.nextInt(bc-fc);
				int b = fc+random.nextInt(bc-fc);
				
				randomColor = new Color(r,g,b);
				
				return randomColor;
			}
}

