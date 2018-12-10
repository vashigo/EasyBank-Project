var attempt = 3; // Variable to count number of attempts.
// Below function Executes on click of login button.
function validate(){
  var identificacion = document.getElementById("identificacion").value;
  var password = document.getElementById("password").value;
  console.log("identificacion" + identificacion);
  if ( identificacion == 41000123){   
    alert ("Error al Crear Cuenta\nUsted se encuentra reportado en CIFIN");
    //window.location = "success.html"; // Redirecting to other page.
    return false;
  }
  else{
    attempt --;// Decrementing by one.
    alert("Cuenta Creada Satisfactoriamente");
    window.location = "login.html"; // Redirecting to other page.
    // Disabling fields after 3 attempts.
    if( attempt == 0){
      document.getElementById("username").disabled = true;
      document.getElementById("password").disabled = true;
      document.getElementById("submit").disabled = true;
      return false;
    }
  }
}

$(window, document, undefined).ready(function() {

  $('input').blur(function() {
    var $this = $(this);
    if ($this.val())
      $this.addClass('used');
    else
      $this.removeClass('used');
  });

  var $ripples = $('.ripples');

  $ripples.on('click.Ripples', function(e) {

    var $this = $(this);
    var $offset = $this.parent().offset();
    var $circle = $this.find('.ripplesCircle');

    var x = e.pageX - $offset.left;
    var y = e.pageY - $offset.top;

    $circle.css({
      top: y + 'px',
      left: x + 'px'
    });

    $this.addClass('is-active');

  });

  $ripples.on('animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd', function(e) {
  	$(this).removeClass('is-active');
  });

});