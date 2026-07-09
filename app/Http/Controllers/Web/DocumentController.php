<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PortfolioDocument;
use App\Models\PromotionRequest;
use Illuminate\Support\Str;


class DocumentController extends Controller
{

    public function store(Request $request, string $id)
    {
        

        $validated = $request->validate([

            'type' => 'required',

            'file' => 'required|file|max:10240',

            'description' => 'nullable'

        ]);


        $promotionRequest = PromotionRequest::where(
            'request_id',
            $id
        )->firstOrFail();



        $file = $request->file('file');


        $path = $file->store('documents');



        PortfolioDocument::create([

            'document_id' => Str::uuid(),

            'application_id' => $promotionRequest->request_id,

            'uploaded_by_user_id' => auth()->user()->id,

            'type' => $validated['type'],

            'description' => $validated['description'] ?? null,

            'file_name' => $file->getClientOriginalName(),

            'storage_path' => $path,

            'file_size' => $file->getSize(),

            'file_mime_type' => $file->getMimeType(),

            'uploaded_at' => now(),

            'created_by' => auth()->user()->id,

        ]);



        return back()
        ->with('success','Document uploaded successfully');

    }

}