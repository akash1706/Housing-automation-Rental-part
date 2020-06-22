
function showHint(str,id) {
  var email = document.getElementById("taskEamil");

     email.setCustomValidity("");



    if (str.length == 0) { 
        document.getElementById("txtHint").innerHTML = "";
        return;
    }else {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("txtHint").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","assign_task_ajax.php?ajax=1&&searchName="+str+"&&taskId="+id, true);
        xmlhttp.send();
    }
}

function validTask() {
    
     var st = document.getElementById("txtHint").innerText;
     var email = document.getElementById("taskEamil");

     //email.setCustomValidity("");
      //st =
      if(st.trim() == "Searching...")
      {
       // console.log(st);
         email.setCustomValidity("Invalid Email");

      }
      else if (st.includes("Already Assigned"))
      {
          email.setCustomValidity("Already Assigned");
      }
              
}

function goLastMonth(month,year)
{
    if(month==1)
      {
        --year;
        month=13;
      }
    document.location.href="?month="+(month-1)+"&year="+year;
         
}


function goNextMonth(month,year){
    if(month==12)
      {
        ++year;
        month=0;
      }
    document.location.href="?month="+(month+1)+"&year="+year;
         
}

function goLastDay(day,month,year)
{
    
    document.location.href="?showtask="+year+"-"+month+"-"+day;
         
}
function goMonthView()
{
    
    document.location.href="my_cal.php";
         
}
function goDayView(day,month,year)
{
    
    document.location.href="?showtask="+day+"-"+month+"-"+year;
         
}
function goWeekView(day,month,year)
{
    
    document.location.href="?week="+year+"-"+month+"-"+day;
         
}