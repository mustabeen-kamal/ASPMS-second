<!DOCTYPE html>
<html>
<head>
<title>Academic Staff</title>

<style>
body{
    background:#f5f3fa;
    font-family:Arial;
    padding:40px;
}

.box{
    background:white;
    padding:25px;
    border-radius:15px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#5b4b8a;
    color:white;
    padding:12px;
}

td{
    padding:12px;
    border-bottom:1px solid #eee;
}

a{
    text-decoration:none;
    background:#5b4b8a;
    color:white;
    padding:8px 15px;
    border-radius:8px;
}
</style>

</head>

<body>

<div class="box">

<h1>Academic Staff</h1>

<br>

<table>

<tr>
<th>Name</th>
<th>Employee Number</th>
<th>Academic Rank</th>
<th>Faculty</th>
<th>Department</th>
<th>Action</th>
</tr>


@foreach($employees as $employee)

<tr>

<td>
{{ $employee->full_name_en }}
</td>

<td>
{{ $employee->employee_number }}
</td>

<td>
{{ $employee->academic_rank }}
</td>

<td>
{{ $employee->faculty_name }}
</td>

<td>
{{ $employee->department_name }}
</td>


<td>
<a href="{{ route('employees.show',$employee->id) }}">
View
</a>
</td>

</tr>

@endforeach


</table>


</div>

</body>
</html>