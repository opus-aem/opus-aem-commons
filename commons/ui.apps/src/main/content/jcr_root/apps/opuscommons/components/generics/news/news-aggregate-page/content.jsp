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
java.util.Comparator,
java.util.List,
com.day.cq.wcm.api.PageManager
    	"%><%
%>
<%!
	private static List<String[]> generateMonthList() {
		List<String[]> list= new ArrayList<String[]>();
		SimpleDateFormat f= new SimpleDateFormat("MMyyyy");

		Calendar c= new GregorianCalendar();
		c.set( Calendar.DAY_OF_MONTH, 1);
		for( int i= 0; i< 12; i++) {

			String[] monthName= {
					"January", "February", "March", "April", "May", "June", "July", "August", 
					"September", "October", "November", "December"
			};
			list.add( 
					new String[]{
							f.format( c.getTime()),
							monthName[ c.get( Calendar.MONTH)]+ " - "+ c.get( Calendar.YEAR)
									});
			c.add( Calendar.MONTH, -1);
		}

		return list;
	}
%>



<div class="content">
	<div class="noticias">
        <h2 class="noticias__titulo"><cq:include path="titulo-da-pagina" resourceType="opuscommons/components/content/simple-text"/></h2>
        <p  class="noticias__info"><cq:include path="introducao-da-pagina" resourceType="opuscommons/components/content/simple-text"/></p>

        <div class="noticias__busca-mes">
			<label class="label busca-mes__label">
				Mês
			</label>
            <div class="container-select-geral">
            <select id="select-mes" class="select busca-mes__select">
                <option value="0" selected></option>
<%
        List<String[]> list= generateMonthList();
		for( String[] t: list) {
            %><option value="<%= t[0]%>"><%=t[1]%></option><%
        }
%>
            </select>
            </div>

			<button class="botao botao--verde busca-mes__botao" id='buscar-noticias'>Buscar</button>
        </div>
		<div class="noticias__paginacao">
			<p class="paginacao__texto">Mostrar por vez: 
                <a class="js-qt-noticias js-qt-selected paginacao__link paginacao__link--ativo" href="#">10</a> | 
                <a class="js-qt-noticias paginacao__link" href="#">20</a> | 
                <a class="js-qt-noticias paginacao__link" href="#">40</a>
            </p>
		</div>

        <!--
        <div>Mostrar por vez 
            <a href="#" class="js-qt-noticias js-qt-selected" data-qt="10">10</a>|
            <a href="#" class="js-qt-noticias" data-qt="20">20</a>|
            <a href="#" class="js-qt-noticias" data-qt="40">40</a>
        </div>-->

    
        <div id='conteudo-noticias'  class="noticias__conteudo" style="display: none"></div>

        <button id='todas-as-noticias' class="botao botao--cinza conteudo__ver-todas-noticias">Ver todas as notícias</button>
    </div>
</div>

<!--  lightbox de noticias  -->
<div id="lightbox-noticias" style="display: none"></div>

<!--TODO: substituir por clientlib -->
<cq:includeClientLib categories="opuscommons.scripts.noticia"/>


