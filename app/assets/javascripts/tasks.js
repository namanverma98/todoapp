document.addEventListener("turbolinks:load",function(){
	$("#tasks").sortable({
		update: function(e,ui){
			$.ajax({
				url: $(this).data("url"),
				type: "PATCH",
				data: $(this).sortable('serialize'),
			});
		}
	});

$('.taskCheckbox').change(function(){
      var currentBox = $(this);
      var checkStatus = currentBox.is(':checked');
      var li_list = currentBox.closest("li").attr('id');
      var is_checked = false;
      if (checkStatus == true)
      {
        is_checked = true;
      }
    $.ajax({
       type:'POST',
       url: '/tasks/mark_as_complete',
       data: $.param({id: li_list, status: is_checked})
    });
});
});
