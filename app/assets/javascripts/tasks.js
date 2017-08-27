$(document).on('change', '.update_task_status', function(){
    
	task_status = $(this).val()
	task_id = $(this).data('id')


	 $.ajax({
        url: '/update_task_status',
        data: {task_id: task_id, task_status: task_status},
        method: 'POST',
        dataType:'JSON',
        beforeSend: function (xhr) {
	        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        },
        success: function (result) {
            console.log(result)
            if (result.response == "Status updated")
                alert('Status Updated')
            else
                alert('Status Not Updated')
        },
        error: function(data) {
          alert(data)
        }
      });

})
 