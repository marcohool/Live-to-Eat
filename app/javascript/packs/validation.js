$(document).ready(function () {
   $("#contact_form").validate({
      rules: {
         name: 'required',
         email: {
            required: true,
            email: true,
            maxlength: 255,
         },
         message: 'required',
      }, messages: {
       name: 'Please enter your name',
       email: 'Enter a valid email',
       message: 'Please enter a message'
      },
   });
});