$(document).ready(function(){
			$('.menu').click(function(){
				$('ul').toggleClass('active');
			})
		});





// Carousel Auto-Cycle
$('.owl-carousel').owlCarousel({
    loop:true,
    margin:10,
    nav:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:3
        },
        1000:{
            items:5
        }
    }
});


$('#click').click(function(){

  $('#inputs').css('display','block')
  $('#inputs').css('transition','4s');



});
$('#close').click(function(){

  $('#inputs').css('display','none')
 



});

$('#menulistid').click(function(){
    
    $('#menulistitem').css('display','block')


});

$('#iconss').click(function(){
    $('#input').css('display','block'),
    $('#iconss').css('display','none')

});


//jump
//modal
var modal = document.getElementById('simpleModal');
var openmodal = document.getElementById('openModal');
var closemodal = document.getElementById('closeModal');

openmodal.addEventListener('click',openfunction);

function openfunction(){
    modal.style.display = 'block';
}

closemodal.addEventListener('click', closefunction);
function closefunction(){
    modal.style.display = 'none';
}
window.addEventListener('click',outsidefunction);

function outsidefunction(e){
    if(e.target == modal){
        modal.style.display = 'none';
    }

}