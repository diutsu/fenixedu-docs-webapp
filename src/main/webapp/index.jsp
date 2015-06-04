<%--

    Copyright � ${project.inceptionYear} Instituto Superior T�cnico

    This file is part of Fenix IST.

    Fenix IST is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Fenix IST is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with Fenix IST.  If not, see <http://www.gnu.org/licenses/>.

--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty LOGGED_USER_ATTRIBUTE}">
	<c:if test="${not empty CAS_AUTHENTICATION_EXCEPTION}" >
	        <c:set var="url" scope="request" value="${pageContext.request.contextPath}/land.html"/>
	</c:if>
        <c:if test="${empty CAS_AUTHENTICATION_EXCEPTION}" >
	        <c:set var="url" scope="request" value="${pageContext.request.contextPath}/login"/>
       	</c:if>
</c:if>

<c:if test="${not empty LOGGED_USER_ATTRIBUTE}">
	<c:set var="url" scope="request" value="${pageContext.request.contextPath}/"/>
</c:if>

<%
	response.sendRedirect((String) pageContext.findAttribute("url"));
%>