$(document).ready(function(){
    var speed = 500;
    
    // check for hash and if div exist... scroll to div
    var hash = window.location.hash;
    if($(hash).length) scrollToID(hash, speed); 
    
    // scroll to div on nav click
    $('.scroll-link').click(function (e) {
        e.preventDefault();
        var id = $(this).attr('href');
        if($(id ).length) scrollToID(id, speed);
        });
    })
    
function scrollToID(id, speed) {
    var offSet = 70;
    var obj = $(id).offset();
    var targetOffset = obj.top - offSet;
    $('html,body').animate({ scrollTop: targetOffset }, speed);
}