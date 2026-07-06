<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatePromotionCycleRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'name_en' => 'sometimes|string|max:255',
            'name_ar' => 'sometimes|string|max:255',

            'start_date' => 'sometimes|date',
            'end_date' => 'sometimes|date|after:start_date',

            'status' => 'sometimes|in:DRAFT,ACTIVE,CLOSED,ARCHIVED',

            'research_weight' => 'sometimes|integer|min:0|max:100',
            'teaching_weight' => 'sometimes|integer|min:0|max:100',
            'service_weight' => 'sometimes|integer|min:0|max:100',

            'anonymous_voting' => 'sometimes|boolean',
        ];
    }
}