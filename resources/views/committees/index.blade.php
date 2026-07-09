<!DOCTYPE html>
<html>
<head>
    <title>Committees</title>

    <style>

        body{

            font-family:Segoe UI;

            background:#f5f3fa;

            padding:40px;

        }

        table{

            width:100%;

            border-collapse:collapse;

            background:white;

        }

        th{

            background:#5b4b8a;

            color:white;

            padding:15px;

        }

        td{

            padding:15px;

            border-bottom:1px solid #eee;

        }

        a{

            text-decoration:none;

        }

    </style>

</head>

<body>

<h1>Committee Assignments</h1>

<br>

<table>

<tr>

<th>Applicant</th>

<th>Committee Member</th>

<th>Tier</th>

<th>Chair</th>

<th>Status</th>

</tr>

@foreach($committees as $committee)

<tr>

<td>

{{ $committee->request->user->username ?? '-' }}

</td>

<td>

{{ $committee->user->username }}

</td>

<td>

{{ ucfirst($committee->tier) }}

</td>

<td>

{{ $committee->is_chair ? 'Yes' : 'No' }}

</td>

<td>

{{ $committee->status }}

</td>

</tr>

@endforeach

</table>

<br>

<a href="{{ route('dashboard') }}">

Back Dashboard

</a>

</body>

</html>