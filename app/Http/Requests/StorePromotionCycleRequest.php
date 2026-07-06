<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StorePromotionCycleRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'name_en' => 'required|string|max:255',
            'name_ar' => 'required|string|max:255',

            'start_date' => 'required|date',
            'end_date' => 'required|date|after:start_date',

            'status' => 'required|in:DRAFT,ACTIVE,CLOSED,ARCHIVED',

            'research_weight' => 'required|integer|min:0|max:100',
            'teaching_weight' => 'required|integer|min:0|max:100',
            'service_weight' => 'required|integer|min:0|max:100',

            'anonymous_voting' => 'required|boolean',
        ];
    }
}