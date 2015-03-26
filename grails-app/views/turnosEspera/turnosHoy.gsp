.ui-content {
    padding: 0 !important;
}

.ui-listview {
    margin: 0 !important;
}

.example-wrapper, .example-wrapper div.iscroll-scroller {
    width: 100% !important;
}


$(document).on('pageinit', '#home', function(){
    var url = 'http://api.themoviedb.org/3/',
        mode = 'search/movie?query=',
        movieName = '&query='+encodeURI('Batman'),
        key = '&api_key=470fd2ec8853e25d2f8d86f685d2270e';

    $.ajax({
        url: url + mode + key + movieName ,
        dataType: "jsonp",
        async: true,
        success: function (result) {
            ajax.parseJSONP(result);
        },
        error: function (request,error) {
            alert('Network error has occurred please try again!');
        }
    });
});

$(document).on('pagebeforeshow', '#headline', function(){
    $('#movie-data').empty();
    $.each(movieInfo.result, function(i, row) {
        if(row.id == movieInfo.id) {
            $('#movie-data').append('<li><img src="http://d3gtl9l2a4fn1j.cloudfront.net/t/p/w185'+row.poster_path+'"></li>');
            $('#movie-data').append('<li>Title: '+row.original_title+'</li>');
            $('#movie-data').append('<li>Release date'+row.release_date+'</li>');
            $('#movie-data').append('<li>Popularity : '+row.popularity+'</li>');
            $('#movie-data').append('<li>Popularity : '+row.vote_average+'</li>');
            $('#movie-data').listview('refresh');
        }
    });
});

$(document).on('vclick', '#movie-list li a', function(){
    movieInfo.id = $(this).attr('data-id');
    $.mobile.changePage( "#headline", { transition: "slide", changeHash: false });
});

var movieInfo = {
    id : null,
    result : null
}

var ajax = {
    parseJSONP:function(result){
        movieInfo.result = result.results;
        $.each(result.results, function(i, row) {
            console.log(JSON.stringify(row));
            $('#movie-list').append('<li><a href="" data-id="' + row.id + '"><img src="http://d3gtl9l2a4fn1j.cloudfront.net/t/p/w185'+row.poster_path+'"/><h3>' + row.title + '</h3><p>' + row.vote_average + '/10</p></a></li>');
        });
        $('#movie-list').listview('refresh');
    }
}



<div data-role="page" id="home">
    <div data-theme="a" data-role="header">
        <h3>
            Movie List
        </h3>
    </div>
    <div data-role="content">
        <div class="example-wrapper" data-iscroll>
            <ul data-role="listview"  id="movie-list" data-theme="a">

            </ul>
        </div>
    </div>
    <div data-theme="a" data-role="footer">
        <h1>Copyright 2013</h1>
    </div>
</div>
<div data-role="page" id="headline">
    <div data-theme="a" data-role="header">
        <a href="#home" class="ui-btn-left" data-transition="slide" data-direction="reverse">Back</a>
        <h3>
            Movie Info
        </h3>
    </div>
    <div data-role="content">
        <ul data-role="listview"  id="movie-data" data-theme="a">

        </ul>
    </div>
</div>
