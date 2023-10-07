<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="${pageContext.request.contextPath}/Images/assets/css/footer.css" rel="stylesheet">

<footer class="footer-clean positionFooter ">
  <fmt:setLocale value="${sessionScope.langue}" />
  <fmt:setBundle basename="ApplicationResource" />
  <div class="container">
    <hr class="pt-4">
    <div class="row justify-content-center">
      <div class="col-sm-4 col-md-3 item">
        <h3 class="titreH3"><fmt:message key="aboutus.titre"/></h3>
        <ul class="listUl">
          <li class="elementLi"><a href="enConstruction.jsp" class="Lien"><fmt:message key="aboutus.equipe"/></a></li>
          <li class="elementLi"><a href="enConstruction.jsp"class="Lien"><fmt:message key="aboutus.histoire"/></a></li>
          <li class="elementLi"><a href="enConstruction.jsp"class="Lien"><fmt:message key="aboutus.philosophie"/></a></li>

        </ul>
      </div>
      <div class="col-sm-4 col-md-3 item">
        <h3 class="titreH3"><fmt:message key="practical.titre"/></h3>
        <ul class="listUl">
          <li class="elementLi"><a href="enConstruction.jsp"class="Lien"><fmt:message key="practical.contact"/></a></li>
          <li class="elementLi"><a href="enConstruction.jsp"class="Lien"><fmt:message key="practical.livraison"/></a></li>

        </ul>

    </div>
  </div>
  </div>
</footer>
