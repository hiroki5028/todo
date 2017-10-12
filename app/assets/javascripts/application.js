// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .

$(function(){
  $(".list-title").on('click',function(){
    var task = $(this);
    var taskId = task.attr('id');

    $.ajax({
      type: "POST",
      url: "/taskid/",
      dataType: "json",
      data: { id: taskId },
      success: function(html) {
        task.parents("nav").remove();
      }
    });
  });
  $(".destroy").on('click',function(){
    var task = $(this);
    var taskId = task.attr('id');
    console.log(task)

    $.ajax({
      type: "DELETE",
      url: "/tasks/" + taskId,
      dataType: "json",
      data: { id: taskId },
      // data: { id: },
      success: function(html) {
        task.parents("nav").remove();
      }
    });
  });
});
