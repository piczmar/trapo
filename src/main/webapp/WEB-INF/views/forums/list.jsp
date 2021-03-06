<%@ page 
  language="java"
  contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="sm" %>
<%@ taglib uri="http://trapo.posterous.com/tags" prefix="trapo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Forums List</title>
    <script type="text/javascript">
      $(function() {
        $("h2").click(function() {
            window.location = $(this).find("a").attr("href");
            return false; 
        });
      });
    </script>
  </head>
  <body>
    <div class="grid_12">
      <c:if test="${message != null}">
        <p class="${message.type}">${message}</p>
      </c:if>
    </div>
    <div class="grid_24">
      <c:forEach items="${forums}" var="forum" varStatus="index">
      <c:set var="status" value="${index.count % 2 == 0 ? 'forum_even' : 'forum_odd'}"/>
      <div class="grid_11 fff ${status}">
        <h2><a href="<trapo:beauty url="/view/forum/" value="${forum.name}" extension="html" />">${forum.name}</a></h2>
        <p class="description">${forum.description}</p>
        <p class="createdAt">Created at ${forum.createdAt}</p>
      </div>
      </c:forEach>
    </div>
  </body>
</html>