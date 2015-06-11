<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/libs/foundation/global.jsp"%>
<%@page 
      import="org.apache.jackrabbit.util.Text,
              com.day.cq.wcm.foundation.Sitemap,
              com.day.cq.wcm.api.PageFilter,
			  java.util.List,
			  br.com.alelo.pesim.core.noticias.Noticias,
              com.day.cq.wcm.api.PageManager"%><%
%>
<%!
public String getp( Page p, String key, String def) {
	if( p.getProperties().get( key)==null) return def;
	else return p.getProperties().get( key).toString();
}

%>
<div class="widget-noticias">
	<h2 class="widget-noticias__titulo">NOTÍCIAS</h2>
	<ul class="widget-noticias__lista">
<%
    int qt= 4;
	try {
    	qt= Integer.parseInt( properties.get( "qt").toString());
    } catch( Exception ignore){}

    Page root = slingRequest.getResourceResolver().adaptTo(PageManager.class).getPage("/content/opuscommons/sample-news");
	List<Page> noticias= Noticias.getAllOrdenadas( root, 0, 0);

	int seq= 1;
	for( Page p: noticias) {
        if( --qt< 0) break;

		%><li class="lista__item">
        	<p class="item__conteudo">
				<a class="conteudo__titulo" href="<%= p.getPath()%>.html">Notícia <%=seq%></a>
                <%= getp( p, "sumario-titulo", "")%>
        	</p>
        </li><%
        seq++;
    }
%>
	</ul>
	<div class="widget-noticias__ver-todas">
		<a class="ver-todas__link" href="/content/pesim/noticias.html">ver todas as notícias</a>
	</div>
</div>

