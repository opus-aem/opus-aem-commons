$(function() {
	
	console.log( 'started!');
	
	
	$('.js-ler-noticia').click( function() {
		var that= this;
		
		console.log( $(that).data( 'id-noticia'));

		var id= $(that).data( 'id-noticia');
		
		//TODO-AEM: substituir pelo path da noticia usando renderizador tipo lightbox. 
		//Ex: /content/pesim/noticias/noticias-<id>.lightbox-com-noticia-na-integra.jsp
		var url= "/content/pesim/noticias/noticia-"+id+".lightbox-com-noticia-na-integra.html";

		$( "#lightbox-noticias").load( url, function() {

			//TODO: Exibir lightbox como modal
			$(this).show();
		});

		return false;

	});

});