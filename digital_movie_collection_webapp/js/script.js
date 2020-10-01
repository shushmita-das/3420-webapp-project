

"use strict"  //this line is correct do not modify it


$( document ).ready(function() {  //This line is correct - do not modify it



  // Test for unique username
     let flag = true;
       $("#username").focus();
       $("#createaccount #username").on("blur", function(){   /* blur is an event used after a textbox has been deselected  */


        $.get( "checkusername.php", { username: $("#username").val() } ).done(function(data) {

        if(data)
        {
           //alert("username alread exist");
           $('#usernameexist').remove();
              $("#username").after("<span id= 'usernameexist' class= 'error'>This username already exist!</span>");
              flag = true;

            }
          else
          {

            $("#usernameexist").remove();
            flag = false;
          }
        })

        .fail(function(jqXHR, textStatus, errorThrown) {
            $("main").prepend();

          });
     });

     // Test for unique username
     $("#username").focus();
     $("#editaccount #username").on("blur", function(ev)   /* blur is an event used after a textbox has been deselected  */
  {
      //alert("Hi");
      $.get( "checkusername.php", { username: $("#username").val() } )
      .done(function(data) {
      if(data)
      {
        //alert("username alread exist");
        $('#usernameexist').remove();
            $("#username").after("<span id= 'usernameexist' class= 'error'>Username already exist!</span>");
            flag = true;

          }
       else
       {
          //alert("username is a new one");
          $("#usernameexist").remove();
          flag = false;
       }
      })

      .fail(function(jqXHR, textStatus, errorThrown) {
          $("main").prepend();

       });
  });





  //Email Verification on create account
  $("#createaccount input[type='submit']").on("click", function(ev){
    let valid = true;
    let $emailerror = $("#createaccount #email~span:contains('valid')");


    let email = $("#createaccount #email").val();
    if(!emailIsValid (email)){
        $emailerror.addClass("error");
        $emailerror.removeClass("noerror");
        valid=false;
      }else{
         $emailerror.addClass("noerror");
        $emailerror.removeClass("error");
      }

  } );

  //Email Verification on edit account
    $("#editaccount input[type='submit']").on("click", function(ev){
    let valid = true;
    let $emailerror = $("#editaccount #email~span:contains('valid')");


    let email = $("#editaccount #email").val();
    if(!emailIsValid (email)){
        $emailerror.addClass("error");
        $emailerror.removeClass("noerror");
        valid=false;
      }else{
         $emailerror.addClass("noerror");
        $emailerror.removeClass("error");
      }

      let $ratingerror = $("#addvid #rating ~ span");
           if($("#addvid #rating").val()==0){
             $ratingerror.addClass("error");
             $ratingerror.removeClass("noerror");
             valid=false;
           }else{
             $ratingerror.addClass("noerror");
             $ratingerror.removeClass("error");

           }

      let $genreerror = $("#addvid #genre ~ span");
          if($("#addvid #genre").val()==0){
              $genreerror.addClass("error");
              $genreerror.removeClass("noerror");
              valid=false;
          }else{
              $genreerror.addClass("noerror");
              $genreerror.removeClass("error");

          }
      let $radiobuttonerror = $("#addvid #radiobutton ~ span");
          if($("#addvid #radiobutton").val()==0){
              $radiobuttonerror.addClass("error");
              $radiobuttonerror.removeClass("noerror");
              valid=false;
          }else{
              $radiobuttonerror.addClass("noerror");
              $radiobuttonerror.removeClass("error");

          }

  });

  //if(!valid)
    //  ev.preventDefault();

//use datepicker to tied to a standard form input field.
// Focus on the input (click, or use the tab key) to open an interactive calendar in a small overlay.
   $(".releaseDay").datepicker({
  dateFormat: "yy-mm-dd"

});
    // Getter
var dateFormat = $( ".releaseDay" ).datepicker( "option", "dateFormat" );
// Setter
$( ".releaseDay" ).datepicker( "option", "dateFormat", "yy-mm-dd" );




//
$('a.deletAcc').confirm({
    content: "You sure about that? (important note: you know all your information will be gone if you delete your account)."

});
$('a.deletAcc').confirm({
    buttons: {
        hey: function(){
            location.href = this.$target.attr('href');
        }
    }
});
$('a.deletevideo').confirm({
    content: "Your sure about that?"
});
$('a.deletevideo').confirm({
    buttons: {
        hey: function(){
            location.href = this.$target.attr('href');
        }
    }
});




//display count
var maxLength = 2500;
$('textarea').keyup(function() {
  var textlen = maxLength - $(this).val().length;
  $('#count').text(textlen);
});






  }); //This line is correct - do not modify it


  //regular expression check for valid email address
   function emailIsValid (email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
  }
