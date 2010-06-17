var words, current_word, i, time1, time2;

function startGame(kind) {
  i=0;
  $('#intro').hide();
  $('#finished').hide();
  $('#game').show();
  $('#romaji').val('');
  $('#kanaform :input').attr('disabled', true);
  // Fetch words
  $.getJSON('/words/'+kind, function(data) {
    words = data;
    current_word = words[0].word;
    $('#kana').html("Starting in 5");
    var p = setInterval(function(){
      var timeLeft = (parseInt($('#kana').html().replace(/[a-z A-Z]*/,''))-1);
      $('#kana').html("Starting in " + timeLeft);
      if(timeLeft==1){
        clearInterval(p);
      }
    },1000);
    setTimeout(function(){
      clearInterval(p); // For.. "safety"
      //$('#romaji').enable();
      $('#kanaform :input').removeAttr('disabled');
      $('#romaji').focus();
      $('#kana').html(current_word.kana);
      time1 = new Date().getTime();
    }, 5000);
    
    $('#kanaform').submit(function(){
      score();
      return false;
    });
    
    $('#romaji').keyup(function(k){
      if(k.keyCode == 13 || $('#romaji').val().length == 0) {
        $('#romaji').css('background-color','#FFFFFF');
      } else {
        if($('#romaji').val() == current_word.romaji.substr(0,$('#romaji').val().length)) {
          $('#romaji').css('background-color', '#BEF49E');
        } else {
          $('#romaji').css('background-color', '#ED743B');
        }
      }
    });
  });
}

function score() {
  if(current_word.romaji == $('#romaji').val()){
    time2 = new Date().getTime();
    var points = Math.ceil($('#kana').html().length/(time2-time1)*100000);
    $('#points').html(parseFloat($('#points').html()) + points);
    $('#animation').html("+" + points);
    $('#animation').fadeIn(200);
    $('#animation').fadeOut(1200);
  }
  i = i + 1;
  if(i>9){
    $('#finalscore').html($('#points').html());
    $('#game').hide();
    $('#finished').show();
    $('#points').html('0');
    $('#animation').html('');
  } else {
    current_word = words[i].word;
    time1 = new Date().getTime();
    $('#romaji').val('');
    $('#kana').html(current_word.kana);
  }
}