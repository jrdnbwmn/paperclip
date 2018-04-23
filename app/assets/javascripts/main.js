// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// InscrybMDE
// -------------------------------------------------------------------
var inscrybmde = new InscrybMDE({
    spellChecker: false,
    autofocus: true,
    toolbar: false,
    status: false,
    element: document.getElementById("inscrybmde"),
});


// Feather
// -------------------------------------------------------------------
feather.replace()


// Popups
// -------------------------------------------------------------------
// Clicking a toggle opens its sibling dropdown
$('.js-popup-toggle').click( function(event){
    event.stopPropagation();
    if ($('.js-popup').is(":visible")) {
        $('.js-popup').hide();
    } else {
        $(this).siblings('.js-popup').show();
    }
});

// Close popup by clicking outside it
$(document).click(function(event) {
    if(!$(event.target).closest('.js-popup').length) {
        if($('.js-popup').is(":visible")) {
            $('.js-popup').hide()
        }
    }
});


// Slidedown
// -------------------------------------------------------------------
$( ".js-slidedown-toggle" ).click(function() {
    $( ".js-slidedown" ).slideToggle( 300, function() {
    });
});


// Modal
// -------------------------------------------------------------------
$( ".js-modal-toggle" ).click(function() {
    $( ".js-modal" ).show();
});
$( ".js-modal-close" ).click(function() {
    $( ".js-modal" ).hide();
});


// Snack bar
// ----------------------------------------------------------------
$( ".js-snack-bar-toggle" ).click(function() {
    $( ".js-snack-bar" ).slideToggle( 300, function() {
    });
});
