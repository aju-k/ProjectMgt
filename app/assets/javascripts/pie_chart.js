$(function(){
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);
})

function drawChart() {
  
  getProjectData().then(function(result){
    parseResponse = $.parseJSON(result['data'])
    console.log(parseResponse)
      parseResponse.map(function (project) {
        var data = new google.visualization.DataTable();
        console.log('aa')

        projectName = project['name'];
        var options = {'title':project['name'],
                 'width':400,
                 'height':300};

          notStarted = project['not_started']
          done = project['done']
          data.addColumn('string', 'Status');
          data.addColumn('number', 'Slices');
          console.log('aa')

          data.addRows([
                  ['Not Started', notStarted],
                  ['Done', done]
            ])
            $('.columns tr').append('<td><div id="'+ projectName+'" style="border: 1px solid #ccc"></div></td>')
            var chart = new google.visualization.PieChart(document.getElementById(projectName));
            chart.draw(data, options);
      })
  })
}

function getProjectData(){
  return new Promise(function(resolve, reject){
   $.ajax({
      url: '/get_project_pie_data',
      method: 'GET',
      dataType:'JSON',
      beforeSend: function (xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      success: function (result) {
          resolve(result)
      },
      error: function(data) {
        reject(data)
      }
  });
})
}
