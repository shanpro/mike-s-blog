$(function(){
  var date = new Date();
  var d = date.getDate();
  var m = date.getMonth();
  var y = date.getFullYear();

  var calendar = $('#calendar').fullCalendar({
    //theme: true, //Remove Comment For color theme
    header: {
      left: 'prev,next today',
      center: 'prevYear title nextYear',
      right: 'month,agendaWeek,agendaDay'
    },
    buttonText: {prevYear: "上一年", nextYear: "下一年", today: "今天", month: "月", week: "周", day: "天"}, 
    selectable: true,
    selectHelper: true,
    select: function(start, end, allDay) {
        timetitle = (allDay && (start.toString() == end.toString())) ? ($.fullCalendar.formatDate(start, "yyyy-MM-dd")) : ($.fullCalendar.formatDate(start, "yyyy-MM-dd HH:mm:ss") + "~~" + $.fullCalendar.formatDate(end, "yyyy-MM-dd HH:mm:ss"))
        var wbox = $("<div id='img_s'><img src='/assets/loading.gif' /></div>").wBox({title:"事件"})
        wbox.showBox()
        $.get("/calendars/form_box", function(data){
          $("#img_s").replaceWith(data)
          $("#wBox form#form_main input.cancel").click(function(){
            $('#wBox_overlay, #wBox').remove();
            return false;
          })
          $("#wBox span.calendar_time").text("时间：" + timetitle)
          $("#wBox input#calendar_start").val($.fullCalendar.formatDate(start, "yyyy-MM-dd HH:mm:ss"))
          $("#wBox input#calendar_end").val($.fullCalendar.formatDate(end, "yyyy-MM-dd HH:mm:ss"))
          $("#wBox input#calendar_allday").val(allDay ? "1" : "0")
          $("#wBox input.submit").click(function(){
            $(this).parents("form#form_main").ajaxSubmit(
              {
                success: function(d){
                  calendar.fullCalendar('renderEvent', { title: $("#wBox input#topic_title").val(), start: start, end: end, allDay: allDay, url: d}, true);
                  wbox.close();
                }
              }
            );
            return false;
          });
          calendar.fullCalendar('unselect');
        })
    },
    editable: true,
    //disableDragging: true,
    //disableResizing: true,
    events: function(start, end, callback) {
              $.ajax({
                  url: '/calendars/current_events',
                  dataType: 'json',
                  data: {
                      start: start,
                      end: end
                  },
                  success: function(data) {
                     callback(data);
                  }
              });
            }

  });
})
