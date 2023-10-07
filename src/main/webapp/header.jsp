<!-- header.jsp -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<header data-bs-theme="dark">
  <fmt:setLocale value="${sessionScope.langue}" />
  <fmt:setBundle basename="ApplicationResource" />

  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp">Fleuriste BdeB</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
              aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item ">
            <a class="nav-link" href="index.jsp"><fmt:message key="navbar.accueil"/></a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="${pageContext.request.contextPath}/MagasinServlet?action=all"><fmt:message key="navbar.magasiner"/></a>
          </li>
        </ul>
       <%-- <form class="d-flex ms-auto" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>--%>

        <ul class="navbar-nav ms-auto mb-2 mb-md-0">
        <fmt:setLocale value="${sessionScope.langue}" />
        <fmt:setBundle basename="ApplicationResource" />
                    <li class="nav-item nav-icon ">
            <a class="nav-link" id="cartIcon" onclick="sendCartContent()">
              <span class="badge text-bg-danger"></span>
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bag-heart-fill" viewBox="0 0 16 16">
                <path d="M11.5 4v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5ZM8 1a2.5 2.5 0 0
                  1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1Zm0 6.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843
                   0-5.132Z"></path>
              </svg>
            </a>
          </li>

          <li class="nav-item nav-icon dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"></path>
                <path  d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"></path>
              </svg>
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="login.jsp"><fmt:message key="navbar.seConnecter"/></a></li>
              <li><a class="dropdown-item" href="#" onclick="deconnexion()"><fmt:message key="navbar.seDeconnecter"/></a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="creationCompte2.jsp"><fmt:message key="navbar.creerCompte"/></a></li>
              <li><a class="dropdown-item" href="profil.jsp"><fmt:message key="navbar.monCompte"/></a></li>
            </ul>
          </li>
          &nbsp;&nbsp;&nbsp;

          <div class="dropdown couleur-font">
            <button class="btn btn-dark dropdown-toggle" type="button" id="langueDropdown" data-bs-toggle="dropdown" aria-expanded="false">
              <fmt:message key="form.langue" />
            </button>
            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="langueDropdown">
              <li>
                <form id="langueForm" method="post" action="LangueServlet">
                  <input type="hidden" name="src" value="1" />
                  <ul class="dropdown-menu-inner">
                    <li><a class="dropdown-item"  onclick="document.getElementById('langue').value='fr_CA'; this.closest('form').submit();"><fmt:message key="form.francais" /></a></li>
                    <li><a class="dropdown-item"  onclick="document.getElementById('langue').value='en_US'; this.closest('form').submit();"><fmt:message key="form.anglais" /></a></li>
                  </ul>
                  <input type="hidden" id="langue" name="langue" value="" />
                </form>
              </li>
            </ul>
          </div>
      </div>
        </ul>

      </div>

  </nav>
</header>
<script src="${pageContext.request.contextPath}/scripts/HeaderScript.js" ></script>
