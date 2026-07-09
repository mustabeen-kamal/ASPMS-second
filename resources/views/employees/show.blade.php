<!DOCTYPE html>
<html>
<head>
<title>Employee Profile</title>

<style>

body{
background:#f5f3fa;
font-family:Arial;
padding:40px;
}

.card{
background:white;
max-width:600px;
margin:auto;
padding:30px;
border-radius:15px;
}

p{
padding:10px;
border-bottom:1px solid #eee;
}

a{
display:inline-block;
margin-top:20px;
background:#5b4b8a;
color:white;
padding:10px 20px;
border-radius:8px;
text-decoration:none;
}

</style>

</head>

<body>

<div class="card">

<h1>
Employee Profile
</h1>

<p>
<strong>Name:</strong>
{{ $employee->full_name_en }}
</p>

<p>
<strong>Employee Number:</strong>
{{ $employee->employee_number }}
</p>


<p>
<strong>Academic Rank:</strong>
{{ $employee->academic_rank }}
</p>


<p>
<strong>Faculty:</strong>
{{ $employee->faculty_name }}
</p>


<p>
<strong>Department:</strong>
{{ $employee->department_name }}
</p>



<a href="{{ route('employees.index') }}">
Back
</a>


</div>

</body>

</html>