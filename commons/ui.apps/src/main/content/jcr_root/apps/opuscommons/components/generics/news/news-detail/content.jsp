<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/libs/foundation/global.jsp"%>





<!-- tela para edição (author) de uma notícias -->

<div class="content noticia">
    <div class="util--espacamento-17"></div>
    <div class="notia__barra-botao util--force-right">
        <button class="botao botao--icone-imprimir-boleto js-imprimir">Imprimir</button>
    </div>
    <div class="util--espacamento-17"></div>

    <h1 class="noticia__titulo subtitulo subtitulo--cinza subtitulo--md"><cq:include path="noticia-titulo" resourceType="pesim/components/custom/general/simple-text"/></h1>
    <hr>

    <div class="util--espacamento-34"></div>

    <p>
		<cq:include path="noticia-conteudo" resourceType="foundation/components/parsys"/>
    </p>
    <div class="util--espacamento-17"></div>

    <div class="notia__barra-botao util--force-right">
        <button class="botao botao--verde js-botao-voltar" >Voltar</button>
    </div>

</div>
<script>
    $(function(){
        $('.js-botao-voltar').click( function() {
			window.history.back();
        });
        $('.js-imprimir').click( function() {
			window.print();
        });
    });
</script>