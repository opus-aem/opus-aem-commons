<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/libs/foundation/global.jsp"%>
<%@page 
      import="com.day.cq.wcm.api.components.ComponentContext,
    		  org.apache.jackrabbit.util.Text,
              com.day.cq.wcm.foundation.Sitemap,
              com.day.cq.wcm.api.PageFilter,
			  java.util.Iterator,
              com.day.cq.wcm.api.PageManager"
                  %><%
%>

<!--  TODO: COMPLETAR COM OS DADOS NA ARVORE DE CONTEÚDO  -->

<!--  TODO: contorno temporario -->
Isso aqui vai ser um lightbox
<div style="border: 1px dotted blue">

<div class="content">

    <%-- Remove ediçao nesta tela adicionando BYPASS_COMPONENT_HANDLING_ON_INCLUDE_ATTRIBUTE, e depois removendo--%>
    <% slingRequest.setAttribute(ComponentContext.BYPASS_COMPONENT_HANDLING_ON_INCLUDE_ATTRIBUTE, true); %>
    <h1>
        <cq:include path="noticia-titulo" resourceType="pesim/components/custom/general/simple-text"/>
    </h1>

    <cq:include path="noticia-conteudo" resourceType="foundation/components/parsys"/>

    <% slingRequest.removeAttribute(ComponentContext.BYPASS_COMPONENT_HANDLING_ON_INCLUDE_ATTRIBUTE);  %>

</div>
