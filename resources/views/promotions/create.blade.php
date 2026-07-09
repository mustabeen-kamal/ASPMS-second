<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Promotion Request - ASPMS</title>
    <style>
        /* (نفس تنسيقات الـ CSS السابقة) */
        body { background:#f5f3fa; padding: 40px; font-family:sans-serif; }
        .form-box { background:white; padding:30px; border-radius:15px; max-width: 600px; margin: auto; box-shadow: 0 5px 15px rgba(0,0,0,.08); }
        .form-group { margin-bottom: 20px; }
        label { display:block; font-weight:bold; margin-bottom:8px; }
        input, textarea, select { width:100%; padding:12px; border:1px solid #ddd; border-radius:10px; }
        .save { background:#5b4b8a; color:white; border:none; padding:13px 25px; border-radius:10px; cursor:pointer; }
    </style>
</head>
<body>

<div class="form-box">
    <h2>Create Promotion Request</h2>
    <br>
    <form action="{{ route('promotions.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <label>Promotion Cycle</label>
            <select name="cycle_id" required>
    <option value="">Select Cycle</option>

    @foreach($cycles as $cycle)
    <option value="{{ $cycle->cycle_id }}">
        {{ $cycle->name_ar }}
    </option>
@endforeach

</select>
        </div>
        <div class="form-group">
        <label>Academic Rank</label>

<input 
type="text"
value="{{ auth()->user()->employee->academic_rank ?? 'N/A' }}"
readonly>
 </div>
        <div class="form-group">
            <label>Description</label>
            <textarea name="description" placeholder="Request details"></textarea>
        </div>
        <div class="form-group">
            <label>Upload Documents</label>
            <input type="file" name="document">
        </div>
        <button type="submit" class="save">Submit Request</button>
    </form>
</div>

</body>
</html>