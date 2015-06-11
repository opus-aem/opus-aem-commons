<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/libs/foundation/global.jsp"%>
<%@page 
      import="
org.apache.jackrabbit.util.Text,
com.day.cq.wcm.foundation.Sitemap,
com.day.cq.wcm.api.PageFilter,
java.util.Iterator,
java.util.Calendar,
java.util.GregorianCalendar,
java.text.SimpleDateFormat,
java.util.ArrayList,
java.util.Collections,
br.com.alelo.pesim.core.noticias.Noticias,
java.util.Comparator,
java.util.List,
com.day.cq.wcm.api.PageManager
    	"%><%
%>
<%!
    public String getp( Page p, String key, String def) {
        if( p.getProperties().get( key)==null) return def;
        else return p.getProperties().get( key).toString();
    }
	private static String monthString( int m) {
        String[] monthName= {
            "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", 
            "Setembro", "Outubro", "Novembro", "Dezembro" };

        return monthName[m-1];
    }

%>


<%

	int m= 0, y= 0;
	int max= 1;

    try {
        if( slingRequest.getParameter( "qt")!= null) {
            max= Integer.parseInt( slingRequest.getParameter( "qt"));
        }
        if( slingRequest.getParameter( "m")!= null) {
            String mesEAno= slingRequest.getParameter( "m");
            m= Integer.parseInt( mesEAno.substring(0, 2), 10);
            y= Integer.parseInt( mesEAno.substring(2, 6), 10);
        }
    } catch( Exception e) {
        e.printStackTrace();
    }
    Page root = slingRequest.getResourceResolver().adaptTo(PageManager.class).getPage("/content/pesim/noticias");
	List<Page> pages= Noticias.getAllOrdenadas( root, m, y);

	SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");


	if( pages==null || pages.size()<= 0) {
        %><h3>oops, nenhuma notícia encontrada..</h3><%
    } else {
        %><div>
            <ul class="conteudo__lista-noticia"><%

            int curMonth= 0;
        	int seq= 1;

            for( Page p: pages) {
                Calendar c= (GregorianCalendar)(p.getProperties().get( "sumario-data"));
                int newMonth= c.get(Calendar.MONTH)+1;
                if( curMonth!= newMonth) {
                    curMonth= newMonth;
					seq= 1;

                    %></ul><h3 class='js-new-month conteudo__mes'><%= monthString( curMonth)+" - "+ c.get(Calendar.YEAR)%></h3><ul class="conteudo__lista-noticia"><%
                }

                %>
                <li class="lista-noticia__item">
					<div class="item__dia">
						<p class="dia__numero"><%= seq %></p>
					</div>
					<article class="item__noticia">
						<h4 class="noticia__titulo">
							<%= getp( p, "sumario-titulo", "")%>
						</h4>
                        <!--<%= format.format(c.getTime())%>-->
                        <div  class="noticia__excerpt">
                            <!-- TODO: Aplicar noticia__except em cada paragrafo e representar como [p] -->
                            <%= getp( p, "sumario-descricao", "")%>
                        </div>
                        <a href="<%= p.getPath()%>.html" class="js-ler-noticia noticia__ler-noticia" data-path-noticia="<%= p.getPath()%>">+ Ler notícia</a>
					</article>

                </li>
                <%
                seq++;
                if( --max<= 0) break;
            }
        %></ul>
		</div><%
    }
%>


