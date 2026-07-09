<!DOCTYPE html>
<html>

<head>
<title>Scorecard Details</title>

<style>

body{
    background:#f5f3fa;
    font-family:"Segoe UI", Arial, sans-serif;
    padding:40px;
}


.container{

    max-width:800px;
    margin:auto;
    background:white;
    padding:35px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.08);

}


h1{

    color:#5b4b8a;
    text-align:center;
    margin-bottom:30px;

}


.info{

    margin-top:20px;

}


.info p{

    padding:14px;
    border-bottom:1px solid #eee;
    font-size:16px;

}


.info strong{

    color:#5b4b8a;

}



.score-box{

    margin-top:25px;
    background:#f5f3fa;
    padding:20px;
    border-radius:12px;

}


.score-box h2{

    color:#5b4b8a;
    margin-bottom:15px;

}



.total{

    margin-top:20px;
    background:#5b4b8a;
    color:white;
    padding:15px;
    border-radius:10px;
    text-align:center;
    font-size:20px;
    font-weight:bold;

}



.comment{

    margin-top:20px;
    padding:15px;
    background:#eee9fa;
    border-radius:10px;

}



.back{

    display:inline-block;
    margin-top:30px;
    background:#5b4b8a;
    color:white;
    padding:12px 25px;
    border-radius:8px;
    text-decoration:none;

}


.back:hover{

    background:#46376d;

}



</style>
</head>


<div class="container">

<h1>
Evaluation Details
</h1>


<div class="info">


<p>
<strong>Applicant:</strong>
{{ $scorecard->application->applicant->username }}
</p>


<p>
<strong>Research Score:</strong>
{{ $scorecard->research_score }}
</p>


<p>
<strong>Teaching Score:</strong>
{{ $scorecard->teaching_score }}
</p>


<p>
<strong>Service Score:</strong>
{{ $scorecard->service_score }}
</p>


</div>



<div class="total">

Total Score:
{{ $scorecard->total_score }}

</div>



<div class="comment">

<strong>Evaluator Comment:</strong>

<br><br>

{{ $scorecard->comment ?? 'No comment' }}

</div>



<a href="{{ route('scorecards.index') }}" class="back">

Back

</a>


</div>

</html>