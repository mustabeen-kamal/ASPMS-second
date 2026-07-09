<!DOCTYPE html>
<html>
<head>

<title>Promotion Request Details</title>

<style>

body{
    background:#f5f3fa;
    font-family:"Segoe UI",Arial,sans-serif;
    padding:40px;
}


.container{

    max-width:900px;
    margin:auto;
    background:white;
    padding:35px;
    border-radius:15px;
    box-shadow:0 5px 15px rgba(0,0,0,.08);

}


h1,h2{

    color:#5b4b8a;
    margin-bottom:20px;

}


.section{

    margin-top:30px;
    padding-top:20px;
    border-top:1px solid #ddd;

}


.info p{

    padding:12px;
    border-bottom:1px solid #eee;

}


label{

    font-weight:bold;

}



input,select,textarea{

    width:100%;
    padding:12px;
    border:1px solid #ddd;
    border-radius:10px;
    margin:10px 0 15px;

}



textarea{

    height:100px;

}



button,.back{

    background:#5b4b8a;
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:8px;
    text-decoration:none;
    cursor:pointer;

}



.card{

    background:#f7f5fc;
    padding:15px;
    border-radius:10px;
    margin-bottom:15px;

}


.empty{

    color:#777;
    padding:10px;

}


</style>


</head>



<body>


<div class="container">



<h1>
Promotion Request Details
</h1>



<div class="info">


<p>
<strong>Applicant:</strong>
{{ $request->user->username ?? 'Unknown' }}
</p>


<p>
<strong>Email:</strong>
{{ $request->user->email ?? '-' }}
</p>


<p>
<strong>Academic Rank:</strong>
{{ $request->academic_rank }}
</p>


<p>
<strong>Cycle:</strong>
{{ $request->cycle->name_en ?? '-' }}
</p>



<p>
<strong>Status:</strong>
{{ ucfirst(strtolower($request->status)) }}
</p>



<p>
<strong>Description:</strong>

{{ $request->description ?? 'No description' }}

</p>


</div>





<div class="section">


<h2>
Upload Document
</h2>


<form action="{{ route('documents.store',$request->request_id) }}"
method="POST"
enctype="multipart/form-data">


@csrf


<label>
Document Type
</label>


<select name="type">


<option value="research_paper">
Research Paper
</option>


<option value="teaching_evaluation">
Teaching Evaluation
</option>


<option value="service_certificate">
Service Certificate
</option>


<option value="thesis">
Thesis
</option>


<option value="other">
Other
</option>


</select>



<label>
Description
</label>


<textarea name="description"></textarea>



<label>
File
</label>


<input type="file" name="file">



<button>
Upload
</button>


</form>


</div>







<div class="section">


<h2>
Uploaded Documents
</h2>



@if($request->documents && $request->documents->count())


@foreach($request->documents as $document)


<div class="card">


<p>
<strong>Type:</strong>
{{ $document->type }}
</p>


<p>
<strong>File:</strong>
{{ $document->file_name }}
</p>


<p>
<strong>Description:</strong>

{{ $document->description }}

</p>


</div>


@endforeach


@else


<p class="empty">
No documents uploaded yet.
</p>


@endif


</div>









<div class="section">


<h2>
Update Workflow Status
</h2>



<form action="{{ route('workflow.update',$request->request_id) }}"
method="POST">


@csrf



<select name="state">


<option value="DEPARTMENT_REVIEW">
Department Review
</option>


<option value="FACULTY_REVIEW">
Faculty Review
</option>


<option value="UNIVERSITY_REVIEW">
University Review
</option>


<option value="APPROVED">
Approved
</option>


<option value="REJECTED">
Rejected
</option>


</select>



<textarea name="comment"
placeholder="Comment">
</textarea>



<button>
Update Status
</button>


</form>


</div>








<div class="section">


<h2>
Workflow History
</h2>


@if($request->workflowStates->count())


@foreach($request->workflowStates as $state)


<div class="card">


<p>
<strong>Status:</strong>
{{ $state->state }}
</p>


<p>
<strong>Comment:</strong>

{{ $state->comment }}

</p>


<p>
<strong>Date:</strong>

{{ $state->performed_at }}

</p>


</div>


@endforeach



@else


<p class="empty">
No workflow history.
</p>


@endif



</div>









<div class="section">


<h2>
Scorecards
</h2>



@if($request->application && $request->application->scorecards)


@foreach($request->application->scorecards as $score)


<div class="card">


<p>
Research:
{{ $score->research_score }}
</p>


<p>
Teaching:
{{ $score->teaching_score }}
</p>


<p>
Service:
{{ $score->service_score }}
</p>


<p>
Total:
{{ $score->total_score }}
</p>


<p>
Comment:
{{ $score->comment }}
</p>


</div>


@endforeach



@else


<p class="empty">
No evaluations yet.
</p>


@endif



</div>








<div class="section">


<h2>
Assign Committee Member
</h2>



<form action="{{ route('committee.assign',$request->request_id) }}"
method="POST">


@csrf



<label>
User
</label>


<select name="user_id">


@foreach(\App\Models\User::all() as $user)


<option value="{{ $user->id }}">

{{ $user->username }}

</option>


@endforeach


</select>




<label>
Tier
</label>


<select name="tier">


<option value="department">
Department
</option>


<option value="faculty">
Faculty
</option>


<option value="university">
University
</option>


</select>



<label>

<input type="checkbox" name="is_chair">

Chair

</label>



<br><br>


<button>
Assign
</button>


</form>


</div>






<br>


<a href="{{ route('promotions.index') }}"
class="back">

Back

</a>



</div>


</body>
</html>