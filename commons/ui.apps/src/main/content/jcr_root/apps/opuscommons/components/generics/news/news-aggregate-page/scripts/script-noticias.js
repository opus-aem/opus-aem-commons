$(function() {

	console.log( 'started!');
    var qt= 10;

    function loadUltimasNoticias() {
		var url= '/content/opuscommons/news.views.last-news.html?qt='+qt;
        $( "#conteudo-noticias").load( url, function() {

            //TODO: Exibir lightbox como modal
            $(this).show();

            attachLerNoticia();
        });
    }

    function loadTodasAsNoticias() {
        var _qt= qt;
        qt= 100;
        loadUltimasNoticias();
        qt= _qt;
    }

    function loadNoticasPorQuery() {
		var m= $('#select-mes option:selected').val();
		var url= '/content/opuscommons/news.views.last-news.html?qt='+qt+'&m='+ m;

		$( "#conteudo-noticias").load( url, function() {

            //TODO: Exibir lightbox como modal
            $(this).show();

            attachLerNoticia();
        });

    }

    function attachLerNoticia() {

        $('.js-ler-noticia').click( function() {

            /**
            var that= this;

            console.log( $(that).data( 'path-noticia'));

            var path= $(that).data( 'path-noticia');

            //TODO-AEM: substituir pelo path da noticia usando renderizador tipo lightbox. 
            //Ex: /content/pesim/noticias/noticias-<id>.lightbox-com-noticia-na-integra.jsp
            var url= path+".views.lightbox.html";

            $( "#lightbox-noticias").load( url, function() {

                //TODO: Exibir lightbox como modal
                $(this).show();
            });

            return false;
			**/
            return true;
        });
    }

    $('.js-qt-noticias').click( function() {
        qt= $(this).data( 'qt');

	    $('.js-qt-noticias').removeClass( 'js-qt-selected');
        $(this).addClass( 'js-qt-selected');

        console.log( 'qt= '+ qt);
        return false;
    });


	loadUltimasNoticias();

    $('#todas-as-noticias').click( function() {
        loadTodasAsNoticias();
    });
    $('#buscar-noticias').click( function() {
		loadNoticasPorQuery();
    });



});