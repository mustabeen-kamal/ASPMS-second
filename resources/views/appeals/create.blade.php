<!DOCTYPE html>
<html>
<head>
<title>Create Appeal</title>

<style>

body{
    background:#f5f3fa;
    font-family:"Segoe UI",Arial,sans-serif;
    padding:40px;
}

.container{

    max-width:700px;
    margin:auto;
    background:white;
    padding:35px;
    border-radius:18px;
    box-shadow:0 6px 18px rgba(0,0,0,.08);

}


h1{

    color:#5b4b8a;
    text-align:center;
    margin-bottom:30px;

}


label{

    font-weight:bold;
    color:#444;

}


select,
textarea{

    width:100%;
    padding:12px;
    margin-top:8px;
    margin-bottom:20px;

    border:1px solid #ddd;
    border-radius:10px;

}


textarea{

    height:150px;
    resize:none;

}


button{

    background:#5b4b8a;
    color:white;

    border:none;

    padding:12px 25px;

    border-radius:8px;

    cursor:pointer;

}


button:hover{

    background:#46366f;

}


.back{

    margin-left:10px;

    text-decoration:none;

    background:#777;

    color:white;

    padding:12px 20px;

    border-radius:8px;

}

</style>

</head>


<body>


<div class="container">


<h1>Create Appeal</h1>


<form action="{{ route('appeals.store') }}" method="POST">

@csrf


<label>
Promotion Application
</label>


<select name="application_id">

<option value="">
-- Select Application --
</option>


@foreach($applications as $application)

<option value="{{ $application->application_id }}">

{{ $application->current_rank }}
 →
{{ $application->target_rank }}

</option>


@endforeach


</select>



<label>
Appeal Reason
</label>


<textarea 
name="reason"
placeholder="Enter appeal reason">
</textarea>



<button type="submit">
Submit Appeal
</button>


<a href="{{ route('appeals.index') }}" class="back">
Back
</a>


</form>


</div>


</body>

</html>