<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>ASPMS Dashboard</title>


<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Segoe UI,Tahoma,Geneva,Verdana,sans-serif;
}


body{
    background:#f4f6fb;
}



header{

    background:#4f46e5;
    color:white;
    padding:20px 40px;

    display:flex;
    justify-content:space-between;
    align-items:center;

}



header h2{

    font-size:24px;

}



.user-box{

    text-align:right;

}



.user-box p{

    font-size:14px;

}



.container{

    width:90%;
    margin:40px auto;

}



.title{

    margin-bottom:30px;

}



.cards{

    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:25px;

}




.card{

    background:white;

    border-radius:12px;

    padding:25px;

    box-shadow:0 5px 15px rgba(0,0,0,.08);

    transition:.3s;

}



.card:hover{

    transform:translateY(-6px);

}



.card h3{

    color:#4f46e5;

    margin-bottom:15px;

}



.card p{

    color:#666;

    margin-bottom:20px;

}



.card a{

    display:inline-block;

    text-decoration:none;

    background:#4f46e5;

    color:white;

    padding:10px 18px;

    border-radius:6px;

}



.logout{

    margin-top:40px;

    text-align:center;

}



.logout button{

    background:#dc2626;

    color:white;

    border:none;

    padding:12px 25px;

    border-radius:8px;

    cursor:pointer;

    font-size:15px;

}



.logout button:hover{

    background:#b91c1c;

}


</style>


</head>



<body>



<header>


<div>

<h2>UIMP - ASPMS</h2>

<p>
Academic Staff Promotion Management System
</p>

</div>



<div class="user-box">

<p>
<strong>{{ auth()->user()->username }}</strong>
</p>

<p>
{{ auth()->user()->email }}
</p>

</div>


</header>




<div class="container">


<div class="title">


<h2>
Dashboard
</h2>


<p>
Welcome to the Academic Staff Promotion Management System.
</p>


</div>





<div class="cards">





{{-- Promotion Requests --}}

@if(
in_array('applicant',$roles)
||
in_array('department_committee',$roles)
||
in_array('faculty_committee',$roles)
||
in_array('university_admin',$roles)
||
in_array('promotion_admin',$roles)
)


<div class="card">

<h3>
Promotion Requests
</h3>


<p>
Create and manage promotion requests.
</p>


<a href="{{ route('promotions.index') }}">
Open
</a>


</div>


@endif







{{-- Committees --}}

@if(
in_array('department_committee',$roles)
||
in_array('faculty_committee',$roles)
||
in_array('university_admin',$roles)
||
in_array('promotion_admin',$roles)
)


<div class="card">


<h3>
Committees
</h3>


<p>
Manage promotion committees.
</p>


<a href="{{ route('committees.index') }}">
Open
</a>


</div>


@endif







{{-- Appeals --}}

@if(
in_array('applicant',$roles)
||
in_array('promotion_admin',$roles)
||
in_array('university_admin',$roles)
)


<div class="card">


<h3>
Appeals
</h3>


<p>
Manage submitted appeals.
</p>


<a href="{{ route('appeals.index') }}">
Open
</a>


</div>


@endif







{{-- Scorecards --}}

@if(
in_array('department_committee',$roles)
||
in_array('faculty_committee',$roles)
||
in_array('promotion_admin',$roles)
||
in_array('university_admin',$roles)
)


<div class="card">


<h3>
Scorecards
</h3>


<p>
View and manage evaluation scores.
</p>


<a href="{{ route('scorecards.index') }}">
Open
</a>


</div>


@endif







{{-- Reports --}}

@if(
in_array('promotion_admin',$roles)
||
in_array('university_admin',$roles)
)


<div class="card">


<h3>
Reports
</h3>


<p>
Generate system reports.
</p>


<a href="{{ route('reports.index') }}">
Open
</a>


</div>


@endif




</div>




<div class="logout">


<form action="{{ route('logout') }}" method="POST">

@csrf


<button type="submit">

Logout

</button>


</form>


</div>



</div>



</body>

</html>