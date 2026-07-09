<!DOCTYPE html>
<html>

<head>

<title>Reports</title>


<style>

body{

background:#f5f3fa;
font-family:"Segoe UI";
padding:40px;

}


.container{

max-width:900px;
margin:auto;
background:white;
padding:30px;
border-radius:15px;

}


h1{

color:#5b4b8a;
text-align:center;

}


.cards{

display:grid;
grid-template-columns:repeat(3,1fr);
gap:20px;

}


.card{

background:#eee9fa;
padding:25px;
border-radius:15px;
text-align:center;

}


.card h2{

color:#5b4b8a;

}


.number{

font-size:30px;
font-weight:bold;

}


.back{

display:inline-block;
margin-top:30px;
background:#5b4b8a;
color:white;
padding:12px 20px;
border-radius:8px;
text-decoration:none;

}

</style>


</head>


<body>


<div class="container">


<h1>
Promotion Reports
</h1>


<div class="cards">


<div class="card">
<h2>Total Applications</h2>

<div class="number">
{{ $totalApplications }}
</div>

</div>



<div class="card">
<h2>Approved</h2>

<div class="number">
{{ $approved }}
</div>

</div>




<div class="card">
<h2>Rejected</h2>

<div class="number">
{{ $rejected }}
</div>

</div>



<div class="card">
<h2>Under Review</h2>

<div class="number">
{{ $underReview }}
</div>

</div>




<div class="card">
<h2>Average Score</h2>

<div class="number">
{{ number_format($averageScore ?? 0,2) }}
</div>

</div>




<div class="card">
<h2>Appeals</h2>

<div class="number">
{{ $totalAppeals }}
</div>

</div>


</div>



<a href="{{ route('dashboard') }}" class="back">
Back
</a>


</div>


</body>

</html>