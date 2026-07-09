<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class PortfolioDocument extends Model
{
    use HasUuids;

    protected $table = 'portfolio_documents';

    protected $primaryKey = 'document_id';

    public $incrementing = false;

    protected $keyType = 'string';


    protected $fillable = [
        'document_id',
        'application_id',
        'uploaded_by_user_id',
        'type',
        'description',
        'file_name',
        'storage_path',
        'file_size',
        'file_mime_type',
        'uploaded_at',
        'created_by',
        'updated_by'
    ];


    public function request()
    {
        return $this->belongsTo(
            PromotionRequest::class,
            'application_id',
            'request_id'
        );
    }
}