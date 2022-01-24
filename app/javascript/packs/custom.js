$( document ).on('turbolinks:load', function() {
    $('#bd').hide();
    $('#user_role').on('change', ()=>{
        if ($('#user_role').val() == "buyer") {
            $('#bd').show();
        }
        else $('#bd').hide();
    })

});


// var do_on_load = function(){
//   $('.bd').hide();
//   $('#user_role').on('change', ()=>{
//       if ($('#user_role').val() == "buyer") {
//           $('.bd').show();
//       }
//       else $('.bd').hide();
//   })
// }
  
// $(document).ready(do_on_load)
// $(window).bind('page:change', do_on_load)