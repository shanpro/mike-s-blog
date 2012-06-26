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
        var wbox = $("#lay_form").wBox({target:$("#form_main"), title:"事件"})
        wbox.find("form input.cancel").click(function(){
          $('#wBox_overlay, #wBox').remove();
          return false;
        })
        console.log(start.toString() +"\n"+ end.toString())
		    timetitle = (allDay && (start.toString() == end.toString())) ? (start.getFullYear() + "-" + (start.getMonth() + 1) + "-" + start.getDate()) : (start.getFullYear() + "-" + (start.getMonth() + 1) + "-" + start.getDate() + " " + start.getHours() + ":" + start.getMinutes() + ":" + start.getSeconds() + "~~" + end.getFullYear() + "-" + (end.getMonth() + 1) + "-" + end.getDate() + " " + end.getHours() + ":" + end.getMinutes() + ":" + end.getSeconds())
        wbox.find("span.calendar_time").text("时间：" + timetitle)
        wbox.find("input#calendar_start").val(start)
        wbox.find("input#calendar_end").val(end)
        wbox.find("input#calendar_allday").val(allDay ? "1" : "0")
        wbox.find("input.submit").click(function(){
          calendar.fullCalendar('renderEvent',
          {
            title: $("#wBox input#topic_title").val(),
            start: start,
            end: end,
            allDay: allDay
          },
          true);
          calendar.fullCalendar('unselect');
        })
        wbox.showBox()
        
        //var title = prompt('这个要改变:');
        //if (title) {
          //calendar.fullCalendar('renderEvent',
          //{
            //title: title,
            //start: start,
            //end: end,
            //allDay: allDay
          //},
          //true // make the event "stick"
          //);
        //D_commenter
        calendar.fullCalendar('unselect');
    },
    editable: true,
    events: [
      {
        title: '全天事件All Day Event',
        start: new Date(y, m, 1),
        url: '/calendars/show'
      },
      {
        title: 'Long Event',
        start: new Date(y, m, d-5),
        end: new Date(y, m, d-2)
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: new Date(y, m, d-3, 16, 0),
        allDay: false
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: new Date(y, m, d+4, 16, 0),
        allDay: false
      },
      {
        title: 'Meeting',
        start: new Date(y, m, d, 10, 30),
        allDay: false
      },
      {
        title: 'Lunch',
        start: new Date(y, m, d, 12, 0),
        end: new Date(y, m, d, 14, 0),
        allDay: false
      },
      {
        title: 'Birthday Party',
        start: new Date(y, m, d+1, 19, 0),
        end: new Date(y, m, d+1, 22, 30),
        allDay: false
      },
      {
        title: 'Click for Google',
        start: new Date(y, m, 28),
        end: new Date(y, m, 29),
        url: 'http://google.com/'
      }
    ]
  });
})
