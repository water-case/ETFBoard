/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.52
 * Generated at: 2021-11-01 07:14:44 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!-- 스크롤 없애기 -->\r\n");
      out.write("<style>\r\n");
      out.write("	::-webkit-scrollbar { \r\n");
      out.write("	display: none !important; // 윈도우 크롬 등\r\n");
      out.write("	}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("				<div class=\"container\">\r\n");
      out.write("					<div class=\"row featurette\">\r\n");
      out.write("						<div class=\"col-md-7\">\r\n");
      out.write("							<br>\r\n");
      out.write("							<h2 class=\"featurette-heading\">투기와 투자</h2>\r\n");
      out.write("							<br>\r\n");
      out.write("							<p class=\"lead\">\r\n");
      out.write("								<strong>투기</strong><br>\r\n");
      out.write("								전략없이 매매차익만을 노리는 방식이다<br>\r\n");
      out.write("								리스크에 완전히 노출된다\r\n");
      out.write("								<br><br>\r\n");
      out.write("								<strong>투자</strong><br>\r\n");
      out.write("								전략을 가지고 장기적 이익을 노리는 방식이다<br>\r\n");
      out.write("								리스크에 대응하며 방식에 따라 리스크가 자산증식의 촉매 역할을 한다\r\n");
      out.write("								\r\n");
      out.write("							</p>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"col-md-5 mt-3\">\r\n");
      out.write("							<br>\r\n");
      out.write("							<img src=\"https://investpension.miraeasset.com/file/imgView.do?fileNm=1558943447675_1.png\" width=\"370\" height=\"250\">\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				\r\n");
      out.write("					<hr class=\"featurette-divider\">\r\n");
      out.write("				\r\n");
      out.write("					<div class=\"row featurette\">\r\n");
      out.write("						<div class=\"col-md-7 order-md-2\">\r\n");
      out.write("							<br>\r\n");
      out.write("							<h2 class=\"featurette-heading\">투자와 자산 배분</h2>\r\n");
      out.write("							<br>\r\n");
      out.write("							<p class=\"lead\">\r\n");
      out.write("								전설적인 투자자들과 투자사들은 공통적으로 자산 배분 전략을 사용하고 있다<br><br>\r\n");
      out.write("								자산을 여러 투자 수단에 특정 비율대로 배분하고 주기적 &middot; 상황 맞춤형 리밸런싱을 하는 것이 자산 배분 투자전략이다\r\n");
      out.write("							</p>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"col-md-5 order-md-1\">\r\n");
      out.write("							<br>\r\n");
      out.write("							<img src=\"http://photo.sentv.co.kr/uploads/editor/news/2021/05/739489797ceba627adf976504464b221.png\" width=\"300\" height=\"250\">\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				\r\n");
      out.write("					<hr class=\"featurette-divider\">\r\n");
      out.write("				\r\n");
      out.write("					<div class=\"row featurette\">\r\n");
      out.write("						<div class=\"col-md-7\">\r\n");
      out.write("							<br>\r\n");
      out.write("							<h2 class=\"featurette-heading\">자산 배분과 ETF</h2>\r\n");
      out.write("							<br>\r\n");
      out.write("							<p class=\"lead\">\r\n");
      out.write("								자산을 배분하기 위해 좋은 회사와 좋은 채권을 고르는 일은 쉽지 않다<br><br>\r\n");
      out.write("								또한 소규모의 자본을 비율에 맞춰 여러가지 회사와 채권에 배분하는 일은 상당히 곤혹스럽다<br><br>\r\n");
      out.write("								ETF는 자산을 배분하는 것을 아주 쉽게 만들어주는 수단이다\r\n");
      out.write("							</p>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div class=\"col-md-5 mt-5\">\r\n");
      out.write("							<img src=\"https://jaetechlab.com/wp-content/uploads/2020/07/image-4.png\" width=\"370\" height=\"210\">\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("				</div>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
