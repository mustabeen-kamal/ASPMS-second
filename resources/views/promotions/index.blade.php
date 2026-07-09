<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ASPMS - Promotion Requests</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:"Segoe UI",Arial,sans-serif; }
        body { background:#f5f3fa; }
        .header { background:#5b4b8a; color:white; padding:25px 40px; display:flex; justify-content:space-between; align-items:center; }
        .header button { background:white; color:#5b4b8a; border:none; padding:12px 20px; border-radius:10px; font-weight:bold; cursor:pointer; }
        .container { padding:35px; }
        .cards { display:grid; grid-template-columns:repeat(auto-fit,minmax(200px,1fr)); gap:20px; margin-bottom:30px; }
        .card { background:white; padding:20px; border-radius:15px; box-shadow:0 5px 15px rgba(0,0,0,.08); }
        .card h3 { color:#777; }
        .card p { font-size:30px; color:#5b4b8a; margin-top:10px; font-weight:bold; }
        .table-box { background:white; padding:25px; border-radius:15px; box-shadow:0 5px 15px rgba(0,0,0,.08); }
        table { width:100%; border-collapse:collapse; }
        th { background:#eee9fa; color:#5b4b8a; padding:15px; text-align:left; }
        td { padding:15px; border-bottom:1px solid #eee; }
        .status { padding:7px 15px; border-radius:20px; font-size:13px; }
        .pending { background:#fff3cd; color:#856404; }
        .approved { background:#d4edda; color:#155724; }
        .rejected { background:#f8d7da; color:#721c24; }
        button.action { padding:8px 14px; border:none; border-radius:8px; cursor:pointer; }
        .edit { background:#eee9fa; color:#5b4b8a; }
        .view { background:#5b4b8a; color:white; }
        .action {
    display:inline-block;
    padding:8px 14px;
    border-radius:8px;
    text-decoration:none;
    font-size:14px;
    margin:2px;
}

.view {
    background:#5b4b8a;
    color:white;
}

.edit {
    background:#eee9fa;
    color:#5b4b8a;
}

.back-btn {
    display: inline-block;
    margin-bottom: 20px;
    padding: 10px 20px;
    background: #5b4b8a;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
}

.back-btn:hover {
    opacity: 0.9;
}
    </style>
</head>
<body>

<div class="header">
    <h1>Academic Staff Promotion Requests</h1>
    <a href="{{ route('promotions.create') }}">
        <button>+ Create Request</button>
    </a>
</div>

<div class="container">
    <div class="cards">
        <div class="card"><h3>Total Requests</h3><p>{{ $totalRequests ?? 0 }}</p></div>
        <div class="card"><h3>Pending</h3><p>{{ $pendingCount ?? 0 }}</p></div>
        <div class="card"><h3>Approved</h3><p>{{ $approvedCount ?? 0 }}</p></div>
        <div class="card"><h3>Rejected</h3><p>{{ $rejectedCount ?? 0 }}</p></div>
    </div>

    <div class="table-box">
    <a href="{{ route('dashboard') }}" class="back-btn">
    Back to Dashboard
</a>
        <h2>Promotion Requests List</h2>
        <br>
        <table>
            <tr>
                <th>Applicant</th>
                <th>Academic Rank</th>
                <th>Cycle</th>
                <th>Submitted Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            @if(isset($requests) && $requests->count())
                @foreach($requests as $request)
                <tr>
                    <td>{{ $request->user->username }}</td>
                    <td>{{ $request->academic_rank }}</td>
                    <td>{{ $request->cycle->name_en ?? 'N/A' }}</td>
                    <td>{{ $request->created_at->format('d/m/Y') }}</td>
                    <td>
                    <span class="status {{ strtolower($request->status) }}">
    {{ ucfirst(strtolower($request->status)) }}
</span>
                    </td>
                    <td>
                    <a href="{{ route('promotions.show', $request->request_id) }}" class="action view"> View</a> @if($request->status == 'PENDING')
                            <a href="{{ route('promotions.edit', $request->request_id) }}" class="action edit">Edit</a>
                        @endif
                    </td>
                </tr>
                @endforeach
            @else
                <tr>
                    <td colspan="6" style="text-align:center">
                        No promotion requests found.
                    </td>
                </tr>
            @endif
        </table>
    </div>
</div>

</body>
</html>