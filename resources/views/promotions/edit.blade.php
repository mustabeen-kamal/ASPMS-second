<!DOCTYPE html>
<html>
<head>
<title>Edit Promotion Request</title>

<style>
body{
background:#f5f3fa;
font-family:sans-serif;
padding:40px;
}

.form-box{
background:white;
max-width:600px;
margin:auto;
padding:30px;
border-radius:15px;
}

input,textarea{
width:100%;
padding:12px;
margin-bottom:15px;
border:1px solid #ddd;
border-radius:10px;
}

button{
background:#5b4b8a;
color:white;
border:none;
padding:12px 25px;
border-radius:10px;
}

</style>

</head>

<body>

<div class="form-box">

<h2>Edit Promotion Request</h2>


<form method="POST"
action="{{ route('promotions.update',$request->request_id) }}">

@csrf
@method('PUT')


<label>
Academic Rank
</label>

<input 
name="academic_rank"
value="{{ $request->academic_rank }}">



<label>
Description
</label>

<textarea name="description">
{{ $request->description }}
</textarea>



<button>
Update
</button>


</form>

</div>

</body>
</html>