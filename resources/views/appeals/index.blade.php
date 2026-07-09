<!DOCTYPE html>
<html>

<head>

<title>Appeals</title>

<style>

body{
    background:#f5f3fa;
    font-family:"Segoe UI",Arial,sans-serif;
    padding:40px;
}


.container{

    max-width:1000px;
    margin:auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.08);

}


h2{

    color:#5b4b8a;
    text-align:center;

}


table{

    width:100%;
    border-collapse:collapse;
    margin-top:25px;

}


th{

    background:#5b4b8a;
    color:white;
    padding:12px;

}


td{

    padding:12px;
    border-bottom:1px solid #eee;
    text-align:center;

}


.status{

    padding:6px 12px;
    border-radius:15px;

}


.pending{

    background:#eee9fa;
    color:#5b4b8a;

}


.approved{

    background:#d8f3dc;
    color:green;

}


.rejected{

    background:#ffd6d6;
    color:red;

}


.back{

    display:inline-block;
    margin-top:25px;
    background:#5b4b8a;
    color:white;
    padding:10px 20px;
    border-radius:8px;
    text-decoration:none;

}


</style>

</head>


<body>


<div class="container">


<h2>
Appeals List
</h2>


<table>


<tr>

<th>Applicant</th>

<th>Reason</th>

<th>Status</th>

<th>Submitted Date</th>

</tr>



@foreach($appeals as $appeal)


<tr>


<td>

{{ $appeal->user->username }}

</td>


<td>

{{ $appeal->reason }}

</td>


<td>

<span class="status {{ strtolower($appeal->status) }}">

{{ $appeal->status }}

</span>

</td>


<td>

{{ $appeal->submitted_at }}

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