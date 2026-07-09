<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\PromotionApplication;
use App\Models\Scorecard;
use App\Models\Appeal;


class ReportController extends Controller
{

    public function index()
    {

        $totalApplications =
            PromotionApplication::count();


        $approved =
            PromotionApplication::where(
                'status',
                'APPROVED'
            )->count();



        $rejected =
            PromotionApplication::where(
                'status',
                'REJECTED'
            )->count();



        $underReview =
            PromotionApplication::whereIn(
                'status',
                [
                    'SUBMITTED',
                    'DEPARTMENT_REVIEW',
                    'FACULTY_REVIEW',
                    'UNIVERSITY_REVIEW'
                ]
            )->count();



        $averageScore =
            Scorecard::avg(
                'total_score'
            );



        $totalAppeals =
            Appeal::count();



        return view(
            'reports.index',
            compact(
                'totalApplications',
                'approved',
                'rejected',
                'underReview',
                'averageScore',
                'totalAppeals'
            )
        );

    }

}