<!DOCTYPE html>
<html>

<head>

<title>Scorecards</title>

<style>

body{

    font-family:Segoe UI;

    background:#f5f3fa;

    padding:40px;

}

.container{

    max-width:1200px;

    margin:auto;

    background:white;

    padding:30px;

    border-radius:15px;

}

table{

    width:100%;

    border-collapse:collapse;

}

th,td{

    padding:15px;

    border-bottom:1px solid #ddd;

}

th{

    background:#5b4b8a;

    color:white;

}

a{

    text-decoration:none;

}

.evaluate{

    background:#5b4b8a;

    color:white;

    padding:8px 15px;

    border-radius:8px;

}

.done{

    color:green;

    font-weight:bold;

}

</style>

</head>

<body>

<div class="table-box">

<h2>Scorecard Evaluation</h2>

<table>

<tr>
    <th>Applicant</th>
    <th>Current Rank</th>
    <th>Status</th>
    <th>Total Score</th>
    <th>Action</th>
</tr>


@foreach($applications as $application)

<tr>

<td>
{{ $application->applicant->username }}
</td>


<td>
{{ $application->current_rank }}
</td>


<td>

@if($application->scorecards->count())

Completed

@else

Pending

@endif

</td>


<td>

@if($application->scorecards->count())

{{ $application->scorecards->first()->total_score }}

@else

-

@endif

</td>



<td>

@if($application->scorecards->count())


<a href="{{ route('scorecards.show',$application->scorecards->first()->scorecard_id) }}"
class="action view">

View

</a>


@else


<a href="{{ route('scorecards.create',$application->application_id) }}"
class="action edit">

Evaluate

</a>


@endif


</td>


</tr>


@endforeach


</table>

<a href="{{ route('dashboard') }}" class="back">

Back

</a>
</div>

</body>

</html>