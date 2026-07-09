<!DOCTYPE html>

<html>

<head>

<title>Evaluate Application</title>

<style>

body{
background:#f5f3fa;
font-family:Segoe UI;
padding:40px;
}


.container{

max-width:600px;
margin:auto;
background:white;
padding:30px;
border-radius:15px;

}


input,textarea{

width:100%;
padding:12px;
margin-bottom:15px;
border-radius:8px;
border:1px solid #ddd;

}


button{

background:#5b4b8a;
color:white;
padding:12px 25px;
border:none;
border-radius:8px;

}


</style>

</head>


<body>


<div class="container">


<h2>
Evaluate Promotion Application
</h2>


<p>
Applicant:
{{ $application->applicant->username }}
</p>


<form method="POST"
action="{{ route('scorecards.store') }}">


@csrf


<input type="hidden"
name="application_id"
value="{{ $application->application_id }}">



<label>
Research Score
</label>

<input type="number"
name="research_score"
required>



<label>
Teaching Score
</label>

<input type="number"
name="teaching_score"
required>



<label>
Service Score
</label>

<input type="number"
name="service_score"
required>



<label>
Comment
</label>

<textarea name="comment"></textarea>



<button>
Save Evaluation
</button>


</form>


</div>


</body>

</html>